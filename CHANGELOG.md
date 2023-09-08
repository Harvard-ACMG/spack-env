# Changelog

This file documents all notable changes to the spack-env repository.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.5]
### Changed
- The specs for `readline@8.2` now use either `gcc@10.2.0` or `gcc@12.2.0`

## [0.1.4]
## Added
- Add spec for `bison@3.0.4` in the `gnu*/packages.yaml` files
- Add spec for `colordiff@1.0.21` in the `gnu*/packages.yaml` files
- Add spec for `readline@8.2` in the the `gnu*/packages.yaml` files
- Added `gnu10/setup.sh` and `gnu12/setup.sh` scripts

### Changed
- Updated `shared/compilers.yaml` with the latest output of `spack compiler find`
- Updated comments in `shared/modules.yaml`
- Updated `README.md` instructions to use one of the `setup.sh` scripts
- Some packages now are built with the Core compiler (`gcc@8.5.0`)

## [0.1.3]
### Added
- Updated `README.md` with tables; added __Documentation__ section
- Added specs for `jq`, `parallel`, and `xterm` to the `packages.yaml` files
- Added specs for onboard packages `openssl` to the `packages.yaml` files

### Changed
- Expanded usage instructions in `README.md`
- Added `hdf5@1.10.7` to `require` list for `cdo` in `gnu10/packages.yaml`
- Added `hdf5@1.14.0` to `require` list for `cdo` in `gnu12/packages.yaml`

## [0.1.2]
### Added
- Release date badge in `README.md`
- Specs for `openjdk` in `gnu*/packages.yaml` files

### Changed
- `tau` specs in `gnu*/packages.yaml` files now use variants `+openmp+ompt+pthread`

## [0.1.1]
### Fixed
- Latest release logo in `README.md` now displays correctly
- Aspect ratio of ACMG logo is now correct in `README.md`

## [0.1.0]
### Added
- Initial version, contains config files to build w/ gcc@10.2.0 and gcc@12.2.0
- Added CHANGELOG.md
- Added LICENSE.txt
- Added README.md
- Added .zenodo.json
