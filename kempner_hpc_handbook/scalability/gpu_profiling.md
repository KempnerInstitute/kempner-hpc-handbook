# GPU Profiling
This section explains why and how to profile CPUs. It helps to understand what the GPU is doing to identify and fix performance bottlenecks. Untile achieving the desired performance the following steps are iterated:
* Profile the code
* Analyze the traces to identify the possible performance bottlenecks
* Fix the bottlenecks and optimize the code.

```{figure} figures/png/profiling_loop.png
---
height: 250px
name: Profiling Loop
---
Profiling Loop to Optimize Code
```
## Profiling using torch profiler
PyTorch profiler is a tool that facilitates collecting different performance metrics during training of the model to better understand what happens behind the scenes such as understanding the most expensive model operators, their impact and study device kernel activity. More particularly to answer the following questions:
* How much GPU run time contirbutes to Computation, Communication or Memory related kernels.
* How much these different categories overlap one another (multiple parallel cuda streams are used for different purposes to provide overlapping).
* What kernels are the most expensive ones in each of the above categories (breakdown).

Following shows how we can wrap the training loop to run in the context of profiler using `with` statement.

```{code} python
from torch.profiler import profile, schedule, tensorboard_trace_handler

tracing_schedule = schedule(skip_first=5, wait=5, warmup=2, active=2, repeat=1)
trace_handler = tensorboard_trace_handler(dir_name=/output/folder, use_gzip=True)

with profile(
  activities = [ProfilerActivity.CPU, ProfilerActivity.CUDA],
  schedule = tracing_schedule,
  on_trace_ready = trace_handler,
  profile_memory = True,
  record_shapes = True,
  with_stack = True
) as prof:

    for step, batch_data in enumerate(data_loader):
        train(batch_data)
        prof.step()
```
````{dropdown} Brief Introduction on Profile Arguments
Using the `schedule`, here we skip the first 5 steps/iterations, wait another 5 steps/iterations, warmup during the next two steps/iterations and then do the active recording during the next 2 steps/iteration. Using the `trace_handler`, we output the profiling traces into a `JSON` file to be analyzed later using Holistic Trace Analysis.

* `activities (iterable)` - list of activity groups (CPU, CUDA) to use in profiling.
* `schedule (callable)` - callable that takes step (int) as a single parameter and returns ProfilerAction value that specifies the profiler action to perform at each step.
* `on_trace_ready (Callable)` - callable that is called at each step when schedule returns
* `profile_memory (bool)` - track tensor memory allocation/deallocation.
* `record_shapes (bool)` - save information about operator’s input shapes.
* `with_stack (bool)` - record source information (file and line number) for the ops.

```{seealso}
For more information about `torch.profiler` refer to: 
https://pytorch.org/docs/stable/profiler.html
```
````
## Holistic Trace Analysis (HTA)
Holistic Trace Analysis (HTA) is an open source performance analysis and visualization Python library for PyTorch users. HTA takes as input Kineto traces collected by the PyTorch Profiler and up-levels the performance information contained in the traces. Kineto Traces are outputted by using `tensorboard_trace_handler` as the `on_trace_ready` callable.

Following are some of the features HTA provides however one can use the library to write their own analysis functions if needed.
* Breakdown of the GPU time in terms of active time (Computation, Communication and Memory) versus idle time. 
* Idle time breaktime to understand whether the idle time is caused by waiting for the host, waiting for another kernel or other.
* Kernel Breakdown to find kernels with the longest execution time.
* Communication Computation overlap in distributed environments.

The HTA library can be installed using `pip`:
```bash
pip install HolisticTraceAnalysis
```

As an example, the following shows how to use HTA to get the Kernel Breakdown from the `torch.profiler` trace file.
```{code}
from hta.trace_analysis import TraceAnalysis
analyzer = TraceAnalysis(trace_dir = "/trace/folder/path")
kernel_type_metrics_df, kernel_metrics_df = analyzer.get_gpu_kernel_breakdown(num_kernels=5, visualize=False)
```
`kernel_type_metrics_df` returned by the function contains the raw values of percentage time spent for each kernel type and is used to generate a pie chart if you pass `visualize=True`. 
Output example of this data frame from traces collected during training could be as follows:

|	| kernel_type | sum | percentage |
|---|---------------------------------------|------------|-----|
| 0	| COMPUTATION	| 149238335 | 95.3 |
| 1	| COMPUTATION overlapping COMMUNICATION | 6732172 | 4.3 |
| 2 |	COMMUNICATION |	292556 | 0.2 |
| 3 |	MEMORY | 252060 |	0.2 |
| 4 |	COMMUNICATION overlapping MEMORY | 1389 |	0.0 |
| 5 |	COMPUTATION overlapping MEMORY | 232 |	0.0 |

The `kernel_metrics_df` contains more details on duration summary statistics for each kernel. It shows the top 5 computation, communication and memory kernels by passing `num_kernels=5`.

```{seealso}
To explore more about the features HTA provides refer to: 
https://hta.readthedocs.io/en/latest/source/intro/using_hta.html
```

## Nvidia Nsight Tools 
Alternatively, Nvidia Nsight Systems and Nsight Compute combination can be used to Analyze and visualize the insight of application’s algorithms. Nsight Systems (High-Level Profiling) checks our code overall to see if there are any problems (e.g., with host and device communication or GPU kernels) identifying non-performant/top kernel(s) and then Nsight Compute (Kernel-Specific Profiling) dives into the details of the identified kernel(s) to help with optimizing, debugging and fixing the issue.
```{figure} figures/png/nsight_systems_compute.png
---
height: 250px
name: NVIDA Nsight Systems and Compute
---
NVIDIA Nsight System and Compute
```