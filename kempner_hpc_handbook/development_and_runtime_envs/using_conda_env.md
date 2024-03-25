# Using Conda Environment

In order to use a conda environment on the cluster, you will need to create a conda environment and then activate it on the compute node. FASRC uses `mamba` as a replacement for `conda` to manage conda environments. `mamba` is a wrapper on `conda` that makes it faster. 

## Creating a Conda Environment

- Step 1: See a list of load modules using the `module list` command.

    ```{tip}
    Verifying the loaded modules is a good practice to avoid conflicts between the loaded modules and any upcoming modules.
    ```

- Step 2: Purge the loaded modules using the `module purge` command if you have any loaded modules and you want to start fresh.
- Step 3: Load `python` module using the `module load python` command. This will load the default version of Python.
- Step 5: Create a conda environment using the `mamba create` command. For example, to create a conda environment named `myenv` with Python 3.12 and installing pip and numpy, you can use the following command:

    ```bash
    mamba create --name myenv python=3.12 pip numpy
    ```
    ```{note}
    You can also create the environment from a `yaml` file. Please see the [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file)'s official documentation for more information.
    ```
- Step 6: Check the location of the conda environment using the `mamba info --envs` command. This will show the list of conda environments and their locations. 

    ```bash
    $ mamba info --envs

            mamba version : 1.5.5
    # conda environments:
    #
    myenv                    /n/home10/<username>/.conda/envs/myenv
    base                     /n/sw/Mambaforge-23.11.0-0
    ```


- Step 7: Activate the conda environment using the `mamba activate` command. For example, to activate the `myenv` environment, you can use the following command:

    ```bash
    mamba activate myenv
    ```


```{warning}
Be aware that the size of the new conda environment can occupy several gigabytes, depending on the number of packages being installed. To conserve disk space, it is advisable to delete any outdated environments. Read more [here](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#removing-an-environment).
```


