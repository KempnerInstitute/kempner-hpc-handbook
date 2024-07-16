(getting_started:accessing_and_navigating_the_cluster)=
# Accessing and Navigating the Cluster

There are two methods for accessing the Kempner Institute HPC cluster. To utilize the resources, one may need to connect via a [VPN](https://docs.rc.fas.harvard.edu/kb/vpn-setup/) (Virtual Private Network). The VPN is not required for Secure Shell (SSH) access, but it is necessary for Open OnDemand access.


## Setting Up a VPN Connection

To set up a VPN connection, follow these steps:

*Skip Steps 1 and 2 if you have the Cisco AnyConnect VPN Client already installed on your local machine.*

1. **Download the VPN Client**: Download the VPN client from the [https://vpn.rc.fas.harvard.edu](https://vpn.rc.fas.harvard.edu). Use username + @ + `fasrc` (e.g., `jharvard@fasrc`) for `USERNAME` field. 
2. **Install the VPN Client**: Install the VPN client on your local machine.
3. **Connect to the VPN**: Open the VPN client and enter `vpn.rc.fas.harvard.edu` and click on the connect button. 
4. **Enter your credentials**: 
    - **username**: username + @ + `fasrc` (e.g., `jharvard@fasrc`)
    - **password**: your FASRC password (reset your password [here](https://portal.rc.fas.harvard.edu/p3/pwreset/))
    - **2FA code**: your 2FA code (Set up 2FA [here](https://docs.rc.fas.harvard.edu/kb/openauth/))

```{note}
For detailed instructions and additional information, please read more about the VPN at [VPN setup guide](https://docs.rc.fas.harvard.edu/kb/vpn-setup/) on FASRC Documentation.
```

```{warning}
Please avoid logging in directly to specific login nodes, as this can disrupt the load balancing on the nodes and may exert undue pressure on a particular login node (e.g., `holylogin01` through `holylogin04`). An exception exists for VSCode, which requires rotation between login nodes. Please refer to the [VSCode Section](development_and_runtime_envs:using_vscode_for_remote_development) for more information.
```

## SSH Access 

You can access the cluster using an SSH client. Use the following command to connect to the cluster:

```bash
ssh <username>@login.rc.fas.harvard.edu
```

Replace `<username>` with your username on the cluster. This command will prompt you to enter your password and a two-factor authentication (2FA) code. After entering your password and a 2FA code, you will be connected to one of the login nodes of the cluster.

```{note}
Please do not use the login node for computationally intensive tasks, as these operations demand considerable computational resources and can severely impact the system's performance for all users. The login node is intended for *file management*, *job submission*, and other *lightweight tasks* only.
```

## Open OnDemand

Open OnDemand is a web-based interface that allows users to access the cluster through a web browser. You can use Open onDemand to start a Remote Desktop session, launch Jupyter notebooks / JupyterLab, RStudio, or other available interactive applications and submit jobs to the cluster.

To access the cluster using Open OnDemand, follow these steps:

- Connect to the VPN
- Open a web browser and navigate to the following URL: [http://vdi.rc.fas.harvard.edu/](http://vdi.rc.fas.harvard.edu/).
- Enter your username and password to log in to the Open OnDemand interface.

Refer to the dedicated [Open OnDemand section](../resource_management/open_ondemand.md) to learn more.