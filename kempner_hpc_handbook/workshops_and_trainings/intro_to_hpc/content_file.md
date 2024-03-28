# Kempner Institute Spring 2024 Compute Workshop

_Date: March 28, 2024_  
_Time: 1:00 - 4:00 PM_  
_Location: SEC 2.118_  
_Presenters: Ella Batty, Naeem Khoshnevis, Max Shad_   

  

> Welcome to the Kempner Institute Spring 2024 Compute Workshop! This workshop is designed to provide an introduction to High-Performance Computing (HPC) and the Kempner Institute HPC cluster. The workshop will cover the basics of HPC, including an overview of the Kempner Institute HPC cluster architecture and storage tiers. We will also discuss data transfer methods, code synchronization, and software modules. The workshop will include an introduction to job management and monitoring, advanced computing techniques, and support and troubleshooting. 


## Infrastructure Orientation

- Welcome and Introduction
- Cluster Access  (<a href="../../getting_started/introduction_and_cluster_basics.html#getting-access-to-the-cluster" target="_blank">Click Here</a>)
- Overview of the Kempner Institute Cluster Architecture (<a href="../../getting_started/overview_of_kempner_cluster.html#what-are-the-specifications-of-the-kempner-institute-hpc-cluster" target="_blank">Click Here</a>)
- Understanding Storage Tiers (<a href="../../storage_and_data_transfer/understanding_storage_options.html" target="_blank">Click Here</a>)
- Shared Open-Source Data Repositories on Cluster (<a href="../../storage_and_data_transfer/shared_data_repository.html" target="_blank">Click Here</a>)
- Good Citizenship on the Cluster (<a href="../../getting_started/kempner_policies_for_responsible_use.html" target="_blank">Click Here</a>)

## Development

- Data Transfer Methods To/From Cluster (Ella)
- Code Synchronization To/From Cluster (Ella)
- VSCode Remote Development (Ella)
- Software Modules in HPC cluster

## Job Management and Monitoring

- Fairshare Policy and Job Priority Basics (Max) (<a href="../../efficient_use_of_resources/fair_use_and_prioritization_policies.html" target="_blank">Click Here</a>)

````{dropdown} Example: Check your lab Fairshare score 
```bash
sshare --account=kempner_grads --all
```
````

````{dropdown} Example: Check your jobs fairshare in the queue
```bash
sprio -l | head -1 &&  sprio -l | grep $USER
```
````

````{dropdown} Example: Check all jobs running on kempner partitions
```bash
squeue -p kempner -o "%.18i %.9P %.20u %.50j %.8T %.10M %.5D %.20R" | sort -n -k 7
```
```bash
squeue -p kempner_requeue -o "%.18i %.9P %.20u %.50j %.8T %.10M %.5D %.20R" | sort -n -k 7
```
````

````{dropdown} Example: Fairshare score calculations 
```bash
scalc
```
````

````{dropdown} Example: Monitor Fairshare progress through Grafana 
<a href="https://dash.rc.fas.harvard.edu/d/qpgIs957z/lab-fairshare?orgId=1&refresh=5m" target="_blank">Check Grafana Dashboard</a>
````


- SLURM Partitions (<a href="../../resource_management/understanding_slurm.html#slurm-partitions" target="_blank">Click Here</a>)
    - FASRC SLURM Partitions (<a href="https://docs.rc.fas.harvard.edu/kb/running-jobs/" target="_blank">Click Here</a>)
````{dropdown} Example: Check SLURM partition settings
```bash
scontrol show partition kempner
```
```bash
scontrol show partition kempner_requeue
```
````

````{dropdown} Example: Check status of all Kempner partitions 
```bash
spart | awk 'NR==1 || /kempner/'
```
````

````{dropdown} Example: Check status of nodes within a Kempner partition
```bash
lsload | head -n 1 & lsload | grep "8a19"
```
```bash
lsload | head -n 1 & lsload | grep "8a17"
```
````

- SLURM Interactive Jobs via Open OnDemand 
- SLURM Batch Job Submission
- Useful Slurm commands
- Monitoring Job Status and Utilization
- What happens when a SLURM job executes

## Advanced Computing Techniques

- Best practices for HPC efficiency
- Introduction to parallel computing (<a href="../../scalability/introduction_to_parallel_computing.html" target="_blank">Click Here</a>)
- Containerization with Singularity (<a href="../../development_and_runtime_envs/containerization.md#containerization" target="_blank">Click Here</a>)
- Distributed Computing and Training ([Click Here](https://github.com/KempnerInstitute/intro-compute-march-2024))

## Support and Troubleshooting

- Troubleshooting Common Issues
- Support Framework: FASRC and Kempner Engineering Team (<a href="https://www.rc.fas.harvard.edu/training/office-hours/" target="_blank">Click Here</a>)
    - Send a ticket to FASRC (`rchelp [at] rc.fas.harvard.edu`)
- Closing Remarks and Q&A Session
