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
