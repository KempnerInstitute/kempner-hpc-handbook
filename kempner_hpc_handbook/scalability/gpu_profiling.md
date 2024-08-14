# GPU Profiling
This section explains how to use `torch.profiler` on your code base in combination with [Tensorboard Plugin](https://github.com/pytorch/kineto/tree/main/tb_plugin) (deprecated: not recommended) or [Holistic Trace Anlysis](https://hta.readthedocs.io/en/latest/) library to get some insights into run time of the GPU (or GPUs on the distributed environments). More particularly we want to answer the following questions:
* How much GPU run time contirbutes to Computation, Communication or Memory related kernels.
* How much these different categories overlap one another.
* What kernels are the most expensive ones in each of the above categories (breakdown).
```{note} 
Multiple parallel cuda streams are used for different purposes to provide overlapping.
```

Further, this section introduces the Nsight System and Nsight Compute for high level overview on GPU profiling as well as the kernel specific profiling respectively.
## Profiling using torch profiler
PyTorch profiler is a tool that facilitates collecting different performance metrics during training of the model to better understand what happens behind the scenes such as understanding the most expensive model operators, their impact and study device kernel activity. Following shows how we can wrap the training loop to run in the context of profiler using `with` statement.

```{code}
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
Using the `schedule`, here we skip the first 5 steps/iterations, wait another 5 steps/iterations, warmup during the next two steps/iterations and then do the active recording during the next 2 steps/iteration. Using the `trace_handler`, we output the profiling logs into a `JSON` file to be analyzed later using Tensorboard (deprecated) or  Holistic Trace Analysis (recommended).

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
## Holistic Trace Analysis (HTA)

## Nsight System (High-Level Profiling)

## Nsight Compute (Kernel-Specific Profiling)
