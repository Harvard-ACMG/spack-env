<a href="https://acmg.seas.harvard.edu"><img src="https://acmg.seas.harvard.edu/sites/projects.iq.harvard.edu/files/acmg/files/img_acmg_logo_small.png" width="200" height="187" alt="ACMG logo"></a>

[![Latest
Release](https://img.shields.io/github/v/release/Harvard-ACMG/spack-env?label=Latest%20Release)](https://github.com/Harvard-ACMG/spack-env/releases) [![Release
Date](https://img.shields.io/github/release-date/Harvard-ACMG/spack-env)](https://github.com/Harvard-ACMG/spack-env/releases/) [![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/Harvard-ACMG/spack-env/blob/main/LICENSE.txt)

# spack-env

This repository contains Spack configuration files for building packages on Cannon for the RockyLinux 8.7 operating system.

## Contents

Each of the folders listed below contains configuration files to build software with a different compiler version.  Add new folders for additional compilers as necessary.

### shared

Contains configuration files that can be shared by Spack builds using different compiler versions.

`compilers.yaml`
- Defines metadata about available compilers.

`modules.yaml`
- Specifies recipes for building module files with Spack.

### gnu10

Contains configuration files for using Spack with the GNU Compiler Collection version 10.2.0 compiler on Cannon.

`compilers.yaml`
- Symbolic link to `../shared/compilers.yaml`

`modules.yaml`
- Symbolic link to `../shared/modules.yaml`

`packages.yaml`
- Specifies recipes for building Spack packages with GNU 10.2.0 compilers.

### gnu12

Contains configuration files for using Spack with the GNU Compiler Collection version 12.2.0 compiler on Cannon.

`compilers.yaml`
- Symbolic link to `../shared/compilers.yaml`

`modules.yaml`
- Symbolic link to `../shared/modules.yaml`

`packages.yaml`
- Specifies recipes for building Spack packages with GNU 10.2.0 compilers.

`packages.yaml`
- Specifies recipes for building packages with Spack w/ GNU 12.2.0 compilers.

## Usage

To build software with Spack using these customizations, follow these commands:

```console
cd /net/holy-nfsisilon/ifs/rc_labs/jacob_lab/Lab/seasfs01/Lab/RockyLinux

. spack/share/spack/setup-env.sh                        # do this only once at startup

spack -C spack-env/<build-spec> install <package-name>
```

where `build-spec` is either `gnu10` or `gnu12` and `<package-name>` is the name of the package that you wish to install.

To regenerate module files, use this command:

```console
spack -C spack-env/<build-spec> module lmod refresh -y
```
