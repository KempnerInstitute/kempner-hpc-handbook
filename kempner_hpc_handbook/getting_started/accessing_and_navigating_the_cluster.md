# Accessing and Navigating the Cluster

There are two methods for accessing the Kempner Institute HPC cluster. To utilize the resources, one must connect via a [VPN](https://docs.rc.fas.harvard.edu/kb/vpn-setup/) (Virtual Private Network).


## Setting Up a VPN Connection

To set up a VPN connection, follow these steps:

1. **Download the VPN Client**: Download the VPN client from the [https://vpn.rc.fas.harvard.edu](https://vpn.rc.fas.harvard.edu).
2. **Install the VPN Client**: Install the VPN client on your local machine.
3. **Connect to the VPN**: Open the VPN client and enter `vpn.rc.fas.harvard.edu` and click on the connect button. 
4. **Enter your credentials**: 
    - **username**: username + @ + `fasrc` (e.g., `jharvard@fasrc`)
    - **password**: your FASRC password (reset your password [here](https://portal.rc.fas.harvard.edu/p3/pwreset/))
    - **2FA code**: your 2FA code (Set up 2FA [here](https://docs.rc.fas.harvard.edu/kb/openauth/))

```{note}
For detailed instructions and additional information, please read more about the VPN at [VPN setup guide](https://docs.rc.fas.harvard.edu/kb/vpn-setup/).
```

## SSH Access 

You can access the cluster using a Secure Shell (SSH) client. Use the following command to connect to the cluster:

```bash
ssh <username>@login.rc.fas.harvard.edu
```

Replace `<username>` with your username on the cluster. This command will prompt you to enter your password and two-factor authentication (2FA) code. After entering your password and 2FA code, you will be connected to the login node of the cluster.

```{note}
Please do not use the login node for computationally intensive tasks, as these operations demand considerable computational resources and can severely impact the system's performance for all users. The login node is intended for file management, job submission, and other lightweight tasks only.
```

## Open OnDemand

Open OnDemand is a web-based interface that allows users to access the cluster through a web browser. You can use Open onDemand to start a Remote Desktop session, launch Jupyter notebooks or RStudio, and submit jobs to the cluster.

To access the cluster using Open OnDemand, follow these steps:

- Connect to the VPN
- Open a web browser and navigate to the following URL: [http://vdi.rc.fas.harvard.edu/](http://vdi.rc.fas.harvard.edu/).
- Enter your username and password to log in to the Open OnDemand interface.