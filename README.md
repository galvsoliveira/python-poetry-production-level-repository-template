# Building a production-level Python repository with Poetry (Ubuntu/WSL2) <!-- omit in toc -->

Welcome to the **Production-Level Python Repository with Poetry** template! This repository is designed to help you kickstart your Python project with the power of Poetry while ensuring a smooth setup on Ubuntu or within the Windows Subsystem for Linux 2 (WSL2). Whether you're starting a new project or migrating from an existing one, this template provides you with the tools and guidelines needed to streamline your Python development workflow.

## Why Use This Template? <!-- omit in toc -->

Setting up a robust development environment and managing Python dependencies can be a challenging task, especially when aiming for production-level quality. This template aims to simplify the process by offering:

- **Structured Repository**: An organized project structure to keep your code, scripts, and configurations neatly arranged.

- **Effortless Dependency Management**: Integration with Poetry, a modern Python packaging and dependency management tool, ensuring a seamless experience when adding, removing, or updating project dependencies.

- **WSL2 Compatibility**: Tailored instructions for Windows users leveraging the Windows Subsystem for Linux 2 (WSL2) to bridge the gap between Windows and Ubuntu-based development environments.

- **Git Configuration**: Guidance on configuring Git to track your project's changes effectively.

- **Pre-commit Hooks**: Automated checks for style, formatting, and code quality to maintain a consistent and clean codebase.

By using this template, you can focus on developing your Python project with confidence, knowing that the setup and management of dependencies are taken care of.

---

## Table of Contents <!-- omit in toc -->

- [Template Structure](#template-structure)
- [Configuring WSL2 (for Windows users)](#configuring-wsl2-for-windows-users)
- [Configuring a New or Existing Repository](#configuring-a-new-or-existing-repository)
  - [1. Creating a New Repository](#1-creating-a-new-repository)
  - [2. Cloning an Existing Repository](#2-cloning-an-existing-repository)
  - [3. Configuring Git](#3-configuring-git)
  - [4. Running the Scripts](#4-running-the-scripts)
  - [5. Migrating from requirements.txt to Poetry (optional)](#5-migrating-from-requirementstxt-to-poetry-optional)
- [How to Use Poetry for Dependency Management](#how-to-use-poetry-for-dependency-management)
  - [Activating the Virtual Environment](#activating-the-virtual-environment)
  - [Editing `pyproject.toml`](#editing-pyprojecttoml)
  - [Installing Project Dependencies](#installing-project-dependencies)
  - [Executing Commands in the Virtual Environment](#executing-commands-in-the-virtual-environment)
  - [Managing Dependencies with Poetry](#managing-dependencies-with-poetry)
- [Pre-commit Hooks](#pre-commit-hooks)

---

## Template Structure

The template has the following structure:

```txt
my_project/
├── scripts/
│ ├── 01_config_ubuntu_env.sh
│ ├── 02_install_asdf_plugins.sh
│ ├── 03_install_proj_dep.sh
│ ├── 04_requirements_txt_to_poetry(optional).sh
│ ├── unistall_env.sh
├── .tool-versions
```

Each component serves a specific purpose:

- **`scripts/`**: This directory contains the scripts to configure the environment and install the dependencies of the project.

- **`scripts/01_config_ubuntu_env.sh`**: This script configures the environment in Ubuntu.

- **`scripts/02_install_asdf_plugins.sh`**: This script installs the project's plugins in asdf.

- **`scripts/03_install_proj_dep.sh`**: This script installs the project's dependencies.

- **`scripts/04_requirements_txt_to_poetry(optional).sh`**: This optional script migrates from requirements.txt to Poetry.

- **`scripts/unistall_env.sh`**: This script uninstalls the environment.

- **`.tool-versions`**: This file specifies the versions of the tools to be installed and used in the project, such as Python and Poetry.

## Configuring WSL2 (for Windows users)

1. Download, install VSCode and prepare VSCode for WSL2
   - Download and install VSCode from the following link: <https://code.visualstudio.com/download>.
   - Open VSCode and install the WSL extension (ms-vscode-remote.remote-wsl).
   - Close VSCode.

2. Install WSL2
   - Open PowerShell as an administrator.
   - Run the following command: `wsl --install`.
   - Restart your computer.

3. Create a User for Ubuntu
   - If Ubuntu doesn't open automatically after restarting, search for it in the Windows search bar and open it.
   - Create a user and password for your Ubuntu installation. This will be your Linux user. Be sure to save this information.

4. Open VSCode from Ubuntu Terminal
   - Run the following command in the Ubuntu terminal: `code .`.

**Note:** These instructions are specifically for Windows users configuring WSL2.

## Configuring a New or Existing Repository

### 1. Creating a New Repository

- Click on the "Use this template" button to use this as a template.
- Name your repository.
- Choose whether your repository will be public or private.
- Click on the "Create repository" button to create your new repository.

### 2. Cloning an Existing Repository

Open the Ubuntu terminal and run the following command:

- `git clone <link_of_your_repository>`
- `cd <name_of_your_repository>`

### 3. Configuring Git

You may be asked to configure the git user and email. If so, run the following commands:

- `git config --global user.name "<your_name>"`
- `git config --global user.email "<your_email>"`

### 4. Running the Scripts

Open a terminal in the root of your project and run the following commands:

- `bash scripts/01_config_ubuntu_env.sh`
  - Restart your terminal and run `source ~/.bashrc`.
- `bash scripts/02_install_asdf_plugins.sh`
- `bash scripts/03_install_proj_dep.sh`

### 5. Migrating from requirements.txt to Poetry (optional)

If you have a requirements.txt file and you want to migrate it to Poetry, put the file in the root of the repository and run the following command:

```bash
bash scripts/04_requirements_txt_to_poetry(optional).sh
```

**Note:** Make sure to run these commands in the specified order for proper setup. If you already have a repository, you can start from step 2.

## How to Use Poetry for Dependency Management

### Activating the Virtual Environment

To activate the virtual environment created by Poetry, execute the following command at the root of your project:

```bash
poetry shell
```

This will activate the virtual environment and you will be able to execute commands within its context.

### Editing `pyproject.toml`

Open the `pyproject.toml` file with your preferred text editor and add your project's dependencies under the `[tool.poetry.dependencies]` section. For example:

```toml
[tool.poetry.dependencies]
python = "^3.11"
requests = "^2.26.0"
```

This sets the minimum Python version and adds the "requests" library as a dependency.

### Installing Project Dependencies

To install the project dependencies defined in `pyproject.toml`, execute the following command at the root of your project:

```bash
poetry install
```

This will create a virtual environment and install the project dependencies in it.

### Executing Commands in the Virtual Environment

To execute commands within the context of the virtual environment created by Poetry, you can use the following command:

```bash
poetry run <your_command_here>
```

For example, if you want to run a Python script:

```bash
poetry run python my_script.py
```

### Managing Dependencies with Poetry

- Add a new dependency:

  ```bash
  poetry add <package>
  ```

- Remove a dependency:

  ```bash
  poetry remove <package>
  ```

- Update dependencies:

  ```bash
  poetry update
  ```

## Pre-commit Hooks

If you have configured pre-commit in your project using the `03_install_proj_dep.sh` script, githooks will be set up automatically. This means that style checks, code formatting, among others, will be executed before each commit. Make sure to fix any issues indicated by pre-commit before confirming your changes.

Now you're ready to develop your Python project with Poetry! Remember that Poetry manages your dependencies efficiently and makes it easy to create isolated virtual environments for your projects.
