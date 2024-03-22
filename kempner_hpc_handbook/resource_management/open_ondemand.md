# Open OnDemand

Open OnDemand is a user-friendly, web-based platform designed to facilitate access to high-performance computing (HPC) resources. It streamlines the process of using HPC by providing a no-install, browser-based interface through which users can submit and manage jobs, upload and download data, and run a wide array of applications without any complex command-line instructions. Among the many applications it supports, Open OnDemand offers direct access to RStudio Server, Jupyter Notebook, and Remote Desktop. 

```{note}
Use this link to access Open OnDemand: https://vdi.rc.fas.harvard.edu/.    
A pop up window will appear asking for your 

- FASRC username 
- password 

You will need to use the [VPN](https://docs.rc.fas.harvard.edu/kb/vpn-setup/) to access Open OnDemand.
```

The following figure shows the landing page of Open OnDemand. You can learn more about Open OnDemand by visiting the [FASRC](https://docs.rc.fas.harvard.edu/kb/virtual-desktop/) documentations.

```{figure} figures/png/open_ondemand_example-01.png
---
width: 600 px
name: Open OnDemand Landing Page
```

Click on the Jupiter Notebook icon. This will open a new tab to allocate resources.

```{figure} figures/png/open_ondemand_example-02.png
---
width: 600 px
name: Open OnDemand Allocate Resources
```

Fill out the form and click on the `Launch` button at the end of the page. This will put you in a queue. 

```{figure} figures/png/open_ondemand_example-03.png
---
width: 600 px
name: Queue Job
```

Once the job is running, click on the `connect to Jupyter` button. 

```{figure} figures/png/open_ondemand_example-04.png
---
width: 600 px
name: Launch Jupyter Notebook Interface
```

This will open a new tab with the Jupyter Notebook interface. Depending on your conda kernels, you will see different options to start a new notebook.

```{figure} figures/png/open_ondemand_example-05.png
---
width: 600 px
name: Jupyter Notebook Interface
```
Click on the `Python 3` option to start a new notebook, and run `!nvidia-smi` to check the GPU status.

```{figure} figures/png/open_ondemand_example-06.png
---
width: 600 px
name: Run Jupyter Notebook
```

Done!





