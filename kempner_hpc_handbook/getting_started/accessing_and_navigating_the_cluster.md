# Accessing and Navigating the Cluster

There are two methods for accessing the Kempner Institute HPC cluster. To utilize the resources, one must connect via a [VPN](https://docs.rc.fas.harvard.edu/kb/vpn-setup/) (Virtual Private Network).

1. **SSH Access**: You can access the cluster using a Secure Shell (SSH) client. Use the following command to connect to the cluster:

```bash
ssh <username>@login.rc.fas.harvard.edu
```

Replace `<username>` with your username on the cluster. This command will prompt you to enter your password and two-factor authentication (2FA) code. After entering your password and 2FA code, you will be connected to the login node of the cluster.

```{note}
Please do not use the login node for computationally intensive tasks, as these operations demand considerable computational resources and can severely impact the system's performance for all users. The login node is intended for file management, job submission, and other lightweight tasks only.
```

2. **Open OnDemand**: Open OnDemand is a web-based interface that allows users to access the cluster through a web browser. You can use Open onDemand to start a Remote Desktop session, launch Jupyter notebooks or RStudio, and submit jobs to the cluster.

To access the cluster using Open OnDemand, follow these steps:

- Connect to the Harvard VPN using the [VPN setup guide](https://docs.rc.fas.harvard.edu/kb/vpn-setup/).
- Open a web browser and navigate to the following URL: [http://rcood.rc.fas.harvard.edu/](http://rcood.rc.fas.harvard.edu/).
- Enter your username and password to log in to the Open OnDemand interface.