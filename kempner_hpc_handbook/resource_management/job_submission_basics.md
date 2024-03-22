# Job Submission Basics

You can either run your jobs interactively (with allocating compute resources) or submit them as batch jobs. Interactive jobs are useful for testing and debugging, while batch jobs are useful for running large-scale simulations and analyses. In this section, we will cover the basics of job submission on the Kempner Institute HPC cluster. In both cases, you will need to specify the Kempner Institute partitions and the fairshare account to which the resources will be charged.


## Interactive Jobs

Below are the steps to allocate 1 TB of RAM, 64 CPU cores, and 4 GPUs for an interactive job on the `kempner` partition, with the resources charged to the `kempner_grads` fairshare account for one hour.

- step 1: Connect to [VPN](https://docs.rc.fas.harvard.edu/kb/vpn-setup/)
- step 2: Connect to the cluster using SSH (`ssh <username>@login.rc.fas.harvard.edu`)
- step 3: Allocate resources using the `salloc` command:

```bash
salloc --partition=kempner --account=kempner_grads --time=0-01:00 --mem=1000G --gres=gpu:4 --cpus-per-task=64
```

```{seealso}
For details on how to connect this interactive session to VSCode, plese see the section {ref}`development_and_runtime_envs:using_vscode_for_remote_development:compute_node`.
```

## Batch Jobs

Submitting a batch job in SLURM involves creating a job script that specifies the resources required for the job and the commands to be executed. The job script is essentially a shell script that includes 3 sections:

- Resource and job specifications, 
- Loading modules, setting environment variables, other pre-job tasks, and
- Running the job.

The following is an example of a very simple job script.

```bash
#!/bin/bash
#SBATCH --job-name=my_job
#SBATCH --account=kempner_dev
#SBATCH --partition=kempner
#SBATCH --nodes=1
#SBATCH --ntasks_per_node=1
#SBATCH --cpus-per-task=16
#SBATCH --gpus_per_node=1
#SBATCH --time=0-01:00
#SBATCH --mem=128G


# Load modules
module load python/3.10.9-fasrc01 


# Run the job
python my_script.py
```
In the following table we provide a brief description of the SLURM directives used in the job script.

| Directive | Description |
|-----------|-------------|
| `--job-name` | The name of the job. |
| `--account` | The account to which the resources will be charged. |
| `--partition` | The partition to which the job will be submitted. |
| `--nodes` | The number of nodes required for the job. |
| `--ntasks_per_node` | The number of tasks to be launched on each node. |
| `--cpus-per-task` | The number of CPUs per task. |
| `--gpus_per_node` | The number of GPUs required for the job. |
| `--time` | The time limit for the job. |
| `--mem` | The memory required for the job. |

You can submit the job script using the `sbatch` command:

```bash
sbatch my_job_script.sh
```

```{seealso}
For more details on the SLURM directives run `sbatch  --help` and the [SLURM documentation](https://slurm.schedmd.com/sbatch.html).
```














