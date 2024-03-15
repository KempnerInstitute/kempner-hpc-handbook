# Job Submission Basics

You can either run your jobs interactively (with allocating compute resources) or submit them as batch jobs. Interactive jobs are useful for testing and debugging, while batch jobs are useful for running large-scale simulations and analyses. In this section, we will cover the basics of job submission on the Kempner Institute HPC cluster. In both cases, you will need to specify the Kempner Institute partitions and the fairshare account to which the resources will be charged.


## Interactive Jobs

Below are the steps to allocate 1 TB of RAM, 64 CPU cores, and 4 GPUs for an interactive job on the `kempner` partition, with the resources charged to the `kempner_grads` fairshare account for one hour.

- step 1: Connect to [VPN](https://docs.rc.fas.harvard.edu/kb/vpn-setup/)
- step 2: Connect to the cluster using SSH (`ssh <username>@login.rc.fas.harvard.edu`)
- step 3: Allocate resources using the `salloc` command:

```bash
salloc -p kempner --account kempner_grads -t 0-01:00 --mem 1000G --gres=gpu:4 -c 64
```

```{seealso}
For details on how to connect this interactive session to VSCode, plese see the section {ref}`development_and_runtime_envs:using_vscode_for_remote_development:compute_node`.
```

## Batch Jobs

Submitting a batch job in SLURM involves creating a job script that specifies the resources required for the job and the commands to be executed. The job script is essentially a shell script that, in addition to the shell commands to run your job, includes Slurm directives provided as comments starting with `#SBATCH`. These directives specify the job requirements and settings, such as the number of nodes, CPUs per task, the expected runtime, and the job partition. 





