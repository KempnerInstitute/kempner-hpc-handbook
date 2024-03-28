# Distributed Computing

## When One Computer is Not Enough

Often times the computational resources of a single node are not enough to solve a problem in a reasonable amount of time. This can be due to data size or limitations of compute, where more CPUs or GPUs are required than are available on a single node. In these cases, it is necessary to distribute the computation across multiple nodes on a shared network. In HPC and ML contexts, there is also typically shared storage and a scheduler that manages the allocation of resources to ease the work of coordinating distributed jobs. Distributed computing provides a means to massively scale up computation but also introduces a number of complexities and challenges. Distributed computing is a broad topic and an entire field of research in its own right. This chapter will provide an overview of the basic concepts and tools for distributed computing in the context of HPC and ML, with a particular focus on working on a SLURM managed cluster.

## How Slurm Handles Multinode Jobs

To request a multinode job, there a number of `sbatch`/`salloc` flags available to the user. Read more about [`sbatch`](https://slurm.schedmd.com/sbatch.html) and [`salloc`](https://slurm.schedmd.com/salloc.html) on SLURM official documentation. When requesting resources it is also important to consider whether the resources
being requested are allocated on a per node or per task basis. The key flags for multinode jobs are:

- `-N` or `--nodes`: The number of nodes to request for the job. This cannot be greater than the number of tasks requested.
- `-n` or `--ntasks`: The number of tasks to request for the job. This can be greater than the number of nodes requested, in which case multiple tasks will be run on each node. This can also be made to vary with the number of nodes using the `--ntasks-per-node` flag.
- `-c`: This is the number of CPUs per task. This is a per task resource, and the total number of CPUs requested for the job is `--ntasks` $\times$ `-c`. If the task per node description is uneven then the total number of CPUs will be different on each node. Note that all allocated CPUs on the job headnode will be available to the batch script and that task resource limitation will only be enforced on tasks initialized with `srun`.
- `--mem`: The amount of memory to request per node. Note that this is per node and not per task. Therefore the memory  allocated on each node will be shared by all tasks
- `--gres`: This flag can be used to request GPUs or other specialized resources. The resources requested with this flag are per node, and the number of resources requested will be shared by all tasks on the node. When there are multiple tasks on a node trying to divide GPUs, GPU selection will typically be done based on the local rank of the task. Frameworks like Pytorch handle this automatically.

When a multinode job is submitted, slurm will allocate the requested resources and then run the job script on the head node. The other nodes will be allocated
but will be unused unless a task is started on them by using `srun`. In theory tasks can also be started on other nodes through directly sshing into the node and running the task, but this is not recommended as it bypasses the slurm scheduler and can lead to resource contention and other issues. The head node is the node with a rank of 0, and the other nodes are numbered sequentially. The tasks are also numbered sequentially within each node. The environment variables `SLURM_NODEID` and `SLURM_PROCID` can be used to determine the node and task rank of a given task. 

### What is a "Task"?

A task is a single unit of work that can be executed on a single node wihtin a slurm job. Tasks are initialized by calling `srun` within a slurm allocation. Each task has its resources restricted using Cgroups (in a similar manner  to how slurm controls the resources visible to an entire allocation), and the resource for each task can be specified using many of the same flags available to the user when requesting resources for an entire allocation. Slurm automatically handles the placement of tasks on nodes within the allocation, and the user can specify the number of tasks to be run on each node using the `--ntasks-per-node` flag at job submission time. Slurm also sets environment variables within each task process indicating the Node rank and Task rank wihin the allocation. These can be used to coordinate work between tasks within a single allocation. Most distributed computing frameworks use these environment variables to coordinate work between tasks within a single allocation automatically.

## Typical Multinode Job Patterns

### Head and Worker Nodes

The typical pattern for multinode worker jobs is having a process running on one node that coordinates the work of other processes running on other nodes. This is often referred to as a head and worker pattern. The head node is responsible for coordinating the work of the worker nodes, and the worker nodes are responsible for doing the actual computation. The head node is typically responsible for distributing work to the worker nodes, collecting results from the worker nodes, and aggregating the results into a final result. The worker nodes are typically responsible for doing the actual computation, and they may also be responsible for collecting and sending results back to the head node. The head and worker nodes may communicate with each other using a variety of different communication patterns, typically over the network, but where shared file systems exist we also observe a pattern of writing intermediate results to shared storage.

This pattern can be used both for distributed training jobs or embarassingly parallel tasks that don't require the level of communication of distributed training. By handling the scheduling of tasks within a single job rather than outsource the scheduling and distribution of small pieces of work to slurm, we can avoid the overhead of scheduling and launching many small jobs and instead use a single job to manage the distribution of work across many nodes and improve the performance of both our job and of the  cluster as a whole. The frameworks described below all support this pattern, and it is the most common pattern for distributed computing on HPC clusters.


## Common Frameworks for Multinode Jobs

### Pytorch

Pytorch is typically thought of as a library for writing ML training pipelines, but its ecosystem also includes a number of utilities and libraries that
support multinode training. 
- The `torch.distributed` package provides a number of tools for coordinating distributed training, including a `DistributedDataParallel` module that wraps a model and handles the distribution of data and gradients across multiple nodes. 
- Pytorch also includes a `torch.multiprocessing` package that can be used to spawn multiple processes on a single node, which can be used to create a worker pool for distributed training. 
- Pytorch also includes a `torch.distributed.rpc` package that can be used to create distributed RPC services, which can be used to coordinate distributed training or to create distributed parameter servers.

```{note}
Please see the [pytorch documentation](https://pytorch.org/docs/stable/index.html) for more information on how to use these packages. 
```

#### Pytoch Lighting
[Pytorch Lighting](https://lightning.ai/docs/pytorch/stable/) is a highly recommended library, although it is not officially part of the pytorch distribution is. It includes a number of utilities and has built in easy integration with slurm to support multi GPU training. In experiments on the kempner cluster, we have seen pytorch lightning provide near linear scaling as the number of nodes is increased. 

Pytorch and Pytorch lightning support multiple communicatoin backends including both MPI and NCCL. This enables users to make backend changes and optimizations while keeping their model definition and training pipeline the same.


### Ray
[TODO]

### Dask
[TODO]

### MPI
[TODO]
