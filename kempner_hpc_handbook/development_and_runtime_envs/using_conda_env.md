(development_and_runtime_envs:using_conda_env)=
# Using Conda Environment

In order to use a conda environment on the cluster, you will need to create a conda environment and then activate it on the compute node. FASRC uses `mamba` as a replacement for `conda` to manage conda environments. `mamba` is a drop-in replacement for `conda` that is generally much faster. 

## What is a conda environment and why should you use it?


A conda environment is a directory that contains a self-contained instance of Python along with a specific set of packages. For instance, you can create a conda environment called `myenv` with numpy version 1.26.4 installed. When executing Python code within that environment, numpy version 1.26.4 will be used. If you need to run code from a different project requiring an older version of numpy, you can use a different conda environment with that older version of numpy installed.


Overall, conda environments allow you to isolate package versions for different projects or repositories, which reduces conflicts and dependency issues. The use of conda environments also ensures reproducibility; you can export your conda environment, allowing others to run your code in precisely the same environment.



(development_and_runtime_envs:using_conda_env:creation)=
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
    ```{tip}
      You can also add a channel to the command if needed:
      
      ```bash
      mamba create --name myenv python=3.12 pip numpy -c conda-forge
      ```     

      You can also specify the list and order of channels to look for the software pacakges. 

      ```bash
      conda config --add channels conda-forge
      conda config --add channels bioconda
      ```

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


(development_and_runtime_envs:using_conda_env:jupyter)=
## Using a Conda Environment with Jupyter
If you plan to use Jupyter notebooks or JupyterLab on the cluster, and would like to use a conda environment, you need to install `ipykernel` within that conda environment:


```bash
mamba activate myenv
pip install ipykernel
```


You should now be able to change the kernel of the notebook to your conda environment. 

```{seealso}
For details on how select a kernel when running a jupyter notebook in VSCode,  please see the section {ref}`development_and_runtime_envs:using_vscode_for_remote_development:jupyter`.
```

## Exporting a Conda Environment
You can export your conda environment into a `yml` file. This means that other users can recreate your exact conda environment using the `yml` file.


To export your conda environment, run


```bash
mamba activate <environment name>
mamba env export > environment.yml
```


With this command, the `environment.yml` file will contain information about every single package in your environment, including low-level ones you did not explicitly install. Since some of these may be operating system-specific, this could mean that the conda environment is not reproducible across operating systems (Mac OS, Windows, Linux). 


To help ensure your environment is reproducible across operating systems, you can instead run:
```bash
mamba activate <environment name>
mamba env export --from-history > environment.yml
```
The `--from-history` argument ensures that only packages you specifically chose to install are exported. Note however, that if you did not specify the versions of packages when installing them, the versions will not be included in the `yml` file when using the `from-history` flag.


The `--from-history` flag will also result in a `yml` file that does not include information on packages you installed with pip. To include packages you installed using pip, you can run


```bash
pip freeze > requirements.txt
```


Then manually add the following lines to your `environment.yml` file:


```bash
 - pip
 - pip:
   - -r file:requirements.txt
```


A user can recreate your conda this `yml` file can recreate your conda environment by running:


```bash
mamba env create --file environment.yml
```


They will need both the `environment.yml` file and the `requirements.txt` file.


````{seealso}
The [Conda documentation](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) may be useful for further information.
