# Kempner Institute Spring 2024 Compute Workshop

_Date: March 28, 2024_  
_Time: 1:00 - 4:00 PM_  
_Location: SEC 2.118_  
_Presenters: Ella Batty, Naeem Khoshnevis, Max Shad_   

  

> Welcome to the Kempner Institute Spring 2024 Compute Workshop! This workshop is designed to provide an introduction to High-Performance Computing (HPC) and the Kempner Institute HPC cluster. The workshop will cover the basics of HPC, including an overview of the Kempner Institute HPC cluster architecture and storage tiers. We will also discuss data transfer methods, code synchronization, and software modules. The workshop will include an introduction to job management and monitoring, advanced computing techniques, and support and troubleshooting. 


## Infrastructure Orientation

- Welcome and Introduction
- Overview of the Kempner Institute Cluster Architecture
- Understanding Storage Tiers
- Shared Open-Source Data Repositories on Cluster

## Development
````{dropdown} Cluster Access

1. SSH Access
    ```bash
    ssh <username>@login.rc.fas.harvard.edu
    ```

2. Open OnDemand (demo)

See {ref}`getting_started:accessing_and_navigating_the_cluster` for full details. 

````

````{dropdown} Software Modules in HPC cluster

1. **Software modules via module load**

    ```bash
    module avail
    module load python
    ```

    See {ref}`development_and_runtime_envs:software_module_and_environment_management` for full details. 

2. **Conda/mamba environments**

    *Why use conda environments?*


    ```{figure} figures/png/why_conda_env_1.png
    ---
    height: 300 px
    name: Why Conda Env 1
    ```

    ```{figure} figures/png/why_conda_env_2.png
    ---
    height: 300 px
    name: Why Conda Env 2
    ```

    *What is mamba?*

     FASRC uses `mamba`,  a drop-in replacement for `conda` that is generally much faster. 

    ```{admonition} Try it yourself
    Try creating a conda environment called `myenv` in your home directory by following [these steps](development_and_runtime_envs:using_conda_env:creation). Make it usable in jupyter notebooks with [one additional step](development_and_runtime_envs:using_conda_env:jupyter). 
    ```

3. **Spack**


````

````{dropdown} Code Synchronization
   ```{admonition} Try it yourself
    Set up remote development using VSCode by following [these steps](development_and_runtime_envs:using_vscode_for_remote_development). 
   ```
````

````{dropdown} Data Transfer

1. **Scp and Rsync**

````

## Job Management and Monitoring

- Fairshare Policy and Job Priority Basics
- SLURM Interactive Jobs via Open OnDemand
- SLURM Batch Job Submission
- Useful Slurm commands
- Monitoring Job Status and Utilization
- What happens when a SLURM job executes

## Advanced Computing Techniques

- Best practices for HPC efficiency
- Introduction to parallel computing
- *Distributed Computing and Training
- *Containerization with Singularity

## Support and Troubleshooting

- Troubleshooting Common Issues
- Support Framework: FASRC and Kempner Engineering Team
- Closing Remarks and Q&A Session
