<a href="https://acmg.seas.harvard.edu"><img src="https://acmg.seas.harvard.edu/sites/projects.iq.harvard.edu/files/acmg/files/img_acmg_logo_small.png" width="200" height="187" alt="ACMG logo"></a>

[![Latest
Release](https://img.shields.io/github/v/release/Harvard-ACMG/spack-env?label=Latest%20Release)](https://github.com/Harvard-ACMG/spack-env/releases) [![Release
Date](https://img.shields.io/github/release-date/Harvard-ACMG/spack-env)](https://github.com/Harvard-ACMG/spack-env/releases/) [![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/Harvard-ACMG/spack-env/blob/main/LICENSE.txt)

# spack-env: Configuration files for Spack builds on Cannon

This repository contains Spack configuration files for building packages on Cannon for the RockyLinux 8.7 operating system.

## Contents

Each of the folders listed below contains configuration files to build software with a different compiler version.  Add new folders for additional compilers as necessary.

### shared

Contains configuration files that can be shared by Spack builds using different compiler versions.

| File             | Description                         |
| -----------------| ----------------------------------- |
| `compilers.yaml` | Metadata about available compilers  |
| `modules.yaml`   | Recipes for building module files   |

### gnu10

Contains configuration files for using Spack with the GNU Compiler Collection version 10.2.0 compiler on Cannon.

| File             | Description                                              |
| ---------------- | -------------------------------------------------------- |
| `compilers.yaml` | Symbolic link to `../shared/compilers.yaml`              |
| `modules.yaml`   | Symbolic link to `../shared/modules.yaml`                |
| `packages.yaml`  | Specs for packages to be built with GNU 10.2.0 compilers |

### gnu12

Contains configuration files for using Spack with the GNU Compiler Collection version 12.2.0 compiler on Cannon.

| File             | Description                                              |
| ---------------- | -------------------------------------------------------- |
| `compilers.yaml` | Symbolic link to `../shared/compilers.yaml`              |
| `modules.yaml`   | Symbolic link to `../shared/modules.yaml`                |
| `packages.yaml`  | Specs for packages to be built with GNU 12.2.0 compilers |


## Startup

These instructions assume you already have cloned a copy of the Spack repository to the `RockyLinux` folder in the Jacob-group lab storage.  Navigate to this folder:

```console
cd /net/holy-nfsisilon/ifs/rc_labs/jacob_lab/Lab/seasfs01/Lab/RockyLinux
```

If you haven't done so yet, also clone this repository here:

```console
git clone https://github.com/Harvard-ACMG/spack-env.git
```

### Source an environment file

Before building software packages with Spack, you will need to source an **environment file** that will load software into your login environment.  Environment files for the GNU 10 and GNU 12 compilers may be downloaded from the `envs/` folder of the [cannon-env](https://github.com/Harvard-ACMG/cannon-env) repository.  If you are starting a fresh Spack build we recommend using one of the `*.nospack.env` environment files, which only load FASRC-built software packaes.

For example, to load the GNU 10 compilers and relevant libraries, use this command:

```console
source /path/to/cannon-env/envs/gcclassic.rocky+gnu10.nospack.env
```

or to load the GNU 12 compilers and relevant libraries, use this command:

```console
source /path/to/cannon-env/envs/gcclassic.rocky+gnu12.nospack.env
```

## Customize package files before building software

Before you start building software packages with Spack, make sure to make the following edits:

### Edit the `package.py` file for cdo

Add the following code into the `$SPACK_ROOT/var/spack/repos/builtin/packages/cdo/packages.py file:

```python
# Also need to tell CDO do depend on the MPI library
# if HDF5 is selected (Bob Yantosca, 04 May 2023)
depends_on("mpi", when="+hdf5")
```

This is necessary in order to avoid deactivating the netCDF-Fortran module when the CDO (Climate Data Operators) module is loaded.

## Build software packages with Spack

To build software with Spack using the customizations contained in this repository, follow these commands:

```console
spack -C spack-env/<build-spec> install <package-name>
```

where `build-spec` is either `gnu10` or `gnu12` and `<package-name>` is the name of the package that you wish to install.

To regenerate module files, use this command:

```console
spack -C spack-env/<build-spec> module lmod refresh -y
```

To clean up build directories, type:

```console
spack clean -a
```
