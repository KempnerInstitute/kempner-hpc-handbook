# Efficient Use of Resources

In the next sections we will cover the best practices for using the Kempner Institute HPC cluster efficiently. Here we discuss general guidelines for using the cluster.


## Expected use cases

Users are expected to use the Kempner cluster solely for Kempner-related research that they are conducting themselves. It is not permitted to use cluster access to run jobs for other people or for projects unrelated to Kempner research.

## Efficient use of resources

Please be mindful of how you use this resource to ensure everyone gets to use it as much as possible. Try to write efficient code that takes advantage of the GPUs you are requesting. Be mindful about tools like Jupyter notebooks, it is easy to accidentally bog down the cluster. Also, please use the partition kempner_requeue if you want to try out something resource intensive but not urgent. This work may be requeued by higher priority work, so you would need to use checkpointing in the event that something higher priority interrupts your run.

The cluster should never be used for CPU-only jobs. The current hardware has 64 cores on each 4-GPU node.  Jobs should be submitted with no more than 16 cores per GPU to allow other users to be able to submit jobs.  

## Communication

Please ensure you are in the cluster-users channel in the Kempner slack space. Make use of this channel if you run into any issues. 

## Good citizenship on the cluster

We don’t limit jobs on the basis of size and encourage users to use capacity when it is available. However, even with efficient code, users submitting large jobs may monopolize resources on the cluster and prevent others from being able to engage in research.  Thus, we rely on users to act in good faith and use consideration when submitting jobs.

Users who submit jobs that use at total of 10% or more of cluster resources (12 GPUs) and that run for a long period of time (4 or more hours) should:

- Use the [Kempner requeue](https://docs.rc.fas.harvard.edu/kb/kempner-partitions/) which allows jobs to be preempted by other jobs and then restarted, thus allowing large jobs to run without disrupting access for the rest of the community.
- If not using the requeue, only submit jobs when there is significant excess capacity and actively monitor the cluster (hourly) to ensure that there are still resources available for other users.
- Use a run-time limit to prevent large jobs from running for a long period of time unexpectedly.
Consider running the job with a smaller number of GPUs over a longer time-period.

If none of the above strategies will work, users should submit a reservation request (see [Cluster Governance Guideline](https://sites.harvard.edu/kempner/computing/)) so that large projects can be planned and communicated to the community, limiting disruptions for other users.  
Users who monopolize cluster resources may have jobs canceled without notice, have fairshare significantly reduced, and in serious or repeated circumstances, may lose access to the cluster.

Users who monopolize cluster resources may have jobs canceled without notice, have fairshare significantly reduced, and in serious or repeated circumstances, may lose access to the cluster.


