# Understanding SLURM

SLURM (Simple Linux Utility for Resource Management) is a job scheduler and resource manager that is widely used in high-performance computing (HPC) environments. It is open-source and is designed to be scalable and fault-tolerant. SLURM is used to allocate resources to users and to schedule and manage jobs on a cluster. This document provides an overview of SLURM and its key concepts.

```{note}
Visit [https://www.schedmd.com/](https://www.schedmd.com/) for official SLURM documentation.
```

SLURM commands can be divided into 4 categories:

1. **System Admin Commands**: These commands are used by system administrators to manage the SLURM daemons and the cluster. We will not cover these commands in this handbook.
2. **Cluster Commands**: These commands are used to manage and view the cluster and its resources. Some flags is available only to users with administrative privileges. The following table lists some of the commonly used cluster commands:

    | Command | Description |
    |---------|-------------|
    | `sinfo` | View information about the cluster and its resources. |
    | `scontrol` | Control the SLURM daemons and the cluster. |
    | `sview` | View the cluster in a graphical interface. |

3. **Account/Group/User Commands**: These commands are used to manage and view accounts, groups, and users. The following table lists some of the commonly used account/group/user commands:

    | Command | Description |
    |---------|-------------|
    | `sacct` | Displays accounting data for jobs, job steps, and resource utilization. |
    | `sacctmgr` | Utility for managing Slurm's accounting database. |
    | `sreport` | Generate reports from the accounting data. |
    | `sshare` | Shows the fairshare information for users. |
    | `squota` | Displays storage quotas. |

4. **Job Commands**: These commands are used to submit, manage, and view jobs. The following table lists some of the commonly used job commands:

    | Command | Description |
    |---------|-------------|
    | `sbatch` | Submit a batch script for execution. |
    | `salloc` | Allocate resources for a job step. |
    | `srun` | Run a parallel job. |
    | `squeue` | Display status of jobs. |
    | `scancel` | Cancel a pending or running job. |
    | `sjobexitmod` | View the exit status of a job. |

Going through each of these commands in detail is beyond the scope of this handbook. Please see [SLURM](https://www.schedmd.com/) official documentation for indepth details. However, we will cover the basic usage of some of these commands in the following sections.


## SLURM Partitions

The following partitions are available for Kempner affliates on the FASRC cluster:

| Partition | Description |
|-----------|-------------|
| `kempner` | This GPU block includes 2304 Intel Ice Lake and 144 Nvidia A100 cores, with each water-cooled node featuring 64 cores, 1TB RAM, and 4 GPUs, linked via HDR Infiniband, with a 7-day limit.|
| `kempner_h100` | This GPU block includes 1536 AMD Genoa cores, 64 Nvidia H100 GPUs, water-cooled nodes with 96 cores, 1.5TB RAM, and 4 GPUs, interconnected via NDR Infiniband, with a 3-day limit. |
| `kempner_requeue` | This partition utilizes `kempner` and `kempner_h100` partitions, designed for tasks that can be interrupted and restarted. This partition has a 7 day time limit.|
| `kempner_dev` | TBD |

```{tip}
Run `spart | awk 'NR==1 || /kempner/'` to see the list of kempner partition.
```

## SLURM Accounts

The accounts are used to track the usage of resources on the cluster. You need to specify the account to which the resources will be charged when submitting a job. You can run `sshare -U -u <username>` to see which accounts you have access to and the fairshare information for each account. If you cannot see the account you need, and you think should be a part of that account, please ... [TBD].


## SLURM Variables

When SLURM allocates resources to a job, it sets several environment variables that can be used in the job script. The following table lists some of the commonly used SLURM environment variables:

[TBD]




