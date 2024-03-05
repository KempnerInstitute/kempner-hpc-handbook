# Contributing to the handbook

We welcome contributions to the Kempner Institute HPC User Guide! Whether you are a researcher, student, or HPC enthusiast, your contributions are valuable to the community. This guide is designed to be a comprehensive resource for leveraging High-Performance Computing (HPC) for advanced computational research, and we encourage you to help us improve it.

To contribute to the handbook, please follow these steps:


## Step 1: Decide what to contribute

Before making any changes to the handbook, it is important to decide what you would like to contribute. One way to contribute is picking an existing issue from the [issue tracker](https://github.com/KempnerInstitute/kempner-hpc-handbook/issues) and working on it. If you have an idea for a new section or topic that is not covered in the handbook, you can create a new issue to discuss it with the maintainers. Please note that random contributions without discussing them with the maintainers may not be accepted or may take longer to be reviewed.


## Step 2: Fork the repository

To contribute to the Kempner Institute's handbook, membership in the Institute is not a prerequisite. Anyone with a GitHub account can participate in the documentation process. This is done by forking the handbook's repository, applying your modifications to this fork, and then submitting a pull request to merge your contributions with the main repository.

[TBD: images of forking the repository]

If you have already forked the repository, make sure that your fork is up to date with the main repository before making any changes. You can do this by following the instructions in the [GitHub documentation](https://docs.github.com/en/get-started/quickstart/fork-a-repo#keep-your-fork-synced).


## Step 3: Make changes to the handbook

Once you have forked the repository, you can make changes to the handbook by editing the Markdown files in the `kempner_hpc_handbook` directory. You can use a text editor or a Markdown editor to make changes to the files. If you are not familiar with Markdown, you can refer to the [Markdown Guide](https://www.markdownguide.org/) for a quick introduction.


## Step 4: Build the handbook locally

Before submitting your changes, it is recommended to build the handbook locally to ensure that your changes are displayed correctly. You can build the handbook (while being at the root) using the following command:

```bash
jupyter-book build kempner_hpc_handbook
```

[TBD: Add details for windows users]
[TBD: Add details for using Docker for rendering the book]

After building the handbook, you can view the changes by opening the `kempner_hpc_handbook/_build/html/index.html` file in a web browser.

## Step 5: Stage, commit, and push your changes

After making changes to the handbook, you can add and commit your changes to your forked repository. You can do this by running the following commands in the terminal:

- Stage the files you changed:
```bash
git add [list of files you changed]
```

- Commit the changes:
```bash
git commit -m "Add a short description of the changes you made"
```

- Push the changes to your forked repository:

```bash
git push origin main[or any other branch you are working on]
```

## Step 6: Merge kempner-hpc-handbook/main branch into your current branch

Before submitting a pull request, it is recommended to merge the `main` branch of the main repository into your current branch to ensure that your changes are compatible with the latest version of the handbook. You can do this by running the following commands in the terminal:

- Fetch the latest changes from the main repository:

```bash
git fetch --all
```

- Merge the `main` branch into your current branch:

```bash
git merge kempner-hpc-handbook/main
```

- Push the changes to your forked repository:

```bash
git push origin main[or any other branch you are working on]
```

## Step 7: Submit a pull request

After pushing the changes to your forked repository, you can submit a pull request to merge your changes with the main repository. You can do this by following these steps:

- Navigate to your forked repository on GitHub.
- Click on the "New pull request" button.
- Select the `main` branch of the main repository as the base branch.
- Select the branch with your changes as the compare branch.
- Add a title and description for your pull request.
- Click on the "Create pull request" button to submit your pull request.

Notes:
- Please make sure to describe your changes in the pull request, so that the maintainers can understand the purpose of your contribution.
- If your pull request is related to an existing issue, please mention the issue number in the description of the pull request.
- If you are working on a large contribution, it is recommended to create an issue to discuss the changes with the maintainers before submitting a pull request.
- If your work is still in progress, you can submit a draft pull request to get feedback from the maintainers and other contributors. To do this add "WIP: " to the title of the pull request. This will indicate that the pull request is a work in progress and not ready to be merged.
- After submitting the pull request, the maintainers will review your changes and provide feedback. You may need to make additional changes based on the feedback before your pull request is accepted.
- Depending on the nature and complexity of your contribution, it may take some time for the maintainers to review and merge your pull request. Please be patient and responsive to the feedback provided by the maintainers. During this time, it is your responsiblity to address any conflicts that might happen due to changes in the main repository. So, please make sure to keep your forked repository up to date with the main repository.

Done!


# Notes on contributing figures

If you are contributing figures to the handbook, please make sure to follow these guidelines:

- Each chapter, has a folder in the `kempner_hpc_handbook` directory. Inside each chapter folder, there is a `figures` folder with subfolder for each figure type (e.g., `ai`, `png`, `svg`, `pdf`, etc.). Please make sure to place your figures in the appropriate folder.

- We recommend using vector graphics (e.g., SVG, PDF) for figures whenever possible, as they are scalable and can be easily edited. If you are using raster graphics (e.g., PNG, JPG), which is not recommended, please make sure to use a high resolution (e.g., 300 dpi) to ensure that the figures are displayed correctly in the handbook.

- Please avoid using copyrighted images or figures that are not licensed for reuse. If you are using figures from external sources, make sure to provide proper attribution and licensing information in the figure caption or in the text.

- If you are creating new figures, please make sure to follow the style and formatting guidelines of the handbook to ensure consistency across the chapters.

    - [TBD font type and font size]
    - [TBD color palette]
    - [TBD figure size and aspect ratio]
    - [TBD figure caption format]
    - [TBD background color]

