# Data Transfer


There are many possible methods for transferring data between local environments (such as your laptop) and the Kempner cluster. We focus on three methods in detail below: [scp](scp_section), [rsync](rsync_section), and [globus](globus_section). 

Your choice of method will primarily depend on the size and complexity of the data transfer. Of the three methods we cover below, [scp](scp_section) is the simplest and most straight-forward tool. It may be the best choice for transferring a few small files. [rsync](rsync_section) has improved efficiency and additional functionality, including the advantage of preserving progress if a transfer is interrupted. [Globus](globus_section) should be used for large-scale data transfers.

(scp_section)=
## scp
Scp, which stands for secure copy, is a straight-forward method for copying a few small files. `scp` is a command line tool, which you can use by first specifying the ‘from’ location and then the ‘to’ destination. 

```bash
scp [file path to location of file] [file path to destination of file]
```

If the file is on the cluster, you will need to put your user name and server information before that file path (see Example 1).


You can copy an entire directory of files by using the -r flag (which stands for recursive):

```bash
scp -r [file path to location of directory] [file path to destination of file]
```

````{dropdown} Example 1: Copying a file from laptop to Kempner cluster 

Jane Smith wants to transfer a file called data.npy from her laptop's Downloads folder to her home directory on the cluster. She can accomplish this with running the following command on her laptop.

```bash
scp /Users/janesmith/Downloads/data.npy janesmith@login.rc.fas.harvard.edu:/n/home02/janesmith/projectdata/
```
````

````{dropdown} Example 2: Copying a directory of files from Kempner cluster to laptop

Jane Smith wants to transfer an entire directory, called `results`, from scratch storage on the cluster to her laptop's Documents folder. She can accomplish this with running the following command on her laptop.

```bash
scp -r janesmith@login.rc.fas.harvard.edu:/n/holyscratch01/janesmith_lab/Users/janesmith/results /Users/janesmith/Documents/
``` 
````

```{tip}
You can use the shortcut ‘~’ to stand in for the path to the home directory.

In the examples above, `/Users/janesmith/` is the home directory so Jane could have used `~/Downloads/data.npy` instead of `/Users/janesmith/Downloads/data.npy`.
```

(rsync_section)=
## rsync

Rsync is a versatile, customizable file-copying tool. When you use rsync to transfer files, it only sends differences between the source and destination files, rather than all of the files. This efficient delta-transfer algorithm reduces the amount of data sent over the network and ensures you do not have to start over if the file transfer is disrupted. It also means that rsync is particularly useful in keeping directories synced between two places, including between a local environment and the cluster. 


The command syntax is similar to scp:

```bash
rsync [arguments] [file path to location of file] [file path to destination of file]
```

You can customize the rsync command by adding any of the arguments below directly after the rsync command:

| Rsync Argument | Description |
|---------|-------------|
| `-z` | Compresses the data as it is being sent. This uses CPUs on both ends (to compress/decompress) but is usually faster. |
| `-a` | Archive mode. This ensures rsync preserves information such as time stamps and permissions, and copies directories recursively (meaning that the content of directories inside of the original source directory is also copied). None of these are default rsync behaviors. |
| `-v` | Verbose mode. Gives more information during transfer. |
| `--progress` | Shows a progress meter for each file being transferred. |
| `--dry-run` | Performs a dry run, i.e. displays information but does not actually copy files. Use with -v to check that the command will transfer the intended files before actually doing it. |
| `--exclude PATTERN` | Excludes files from transfer that match the PATTERN. |

```{warning}
Unlike most similar commands, a trailing / on a directory name is meaningful for rsync. It changes the behavior from transferring the whole directory to transferring the contents of the directory. See example 2. 
```

Check out the [rsync documentation](https://download.samba.org/pub/rsync/rsync.1) for further information and additional argument options.

````{dropdown} Example 1: Copying a file from laptop to Kempner cluster 
Jane Smith wants to transfer a file called data.npy from her laptop's Downloads folder to her home directory on the cluster. She can accomplish this with running the following command on her laptop. She will use the archive mode argument (-a) and the verbose mode argument (-v):

```bash
rsync -av /Users/janesmith/Downloads/data.npy janesmith@login.rc.fas.harvard.edu:/n/home02/janesmith/projectdata/
```
````

````{dropdown} Example 2: Copying a directory of files from Kempner cluster to laptop

Jane Smith wants to transfer an entire directory, called `results`, from scratch storage on the cluster to her laptop's Documents folder. She can accomplish this with running the following command on her laptop. She will use the archive mode argument (-a) and the verbose mode argument (-v):

```bash
rsync -av janesmith@login.rc.fas.harvard.edu:/n/holyscratch01/janesmith_lab/Users/janesmith/results /Users/janesmith/Documents/
``` 

This creates a directory called results in the Documents folder, with all the files inside that were in the results directory on the cluster. 

Let's say that Jane includes a trailing '/' on the first file path:

```bash
rsync -av janesmith@login.rc.fas.harvard.edu:/n/holyscratch01/janesmith_lab/Users/janesmith/results/ /Users/janesmith/Documents/
``` 

This behaves differently. Now, the files that were in the results directory on the cluster have been transferred directly to the Documents directory. There is not a 'results' directory on the local machine.

````


(globus_section)=
## Globus
TO DO