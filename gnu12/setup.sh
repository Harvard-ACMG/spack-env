###############################################################################
# setup.sh -- Sets up modules etc. for installation w/ gcc@12.2.0
###############################################################################

#==============================================================================
# Setup the Spack environment if it has not been done yet
#==============================================================================
if [[ "x${SPACK_ROOT}" == "x" ]]; then
    if [[ $- = *i* ]] ; then
	echo "... Initializing Spack (one-time only), please wait ..."
    fi
    . /n/jacob_lab/Lab/RockyLinux/spack/share/spack/setup-env.sh
fi

#==============================================================================
# Also update the MODULEPATH if we have not done it yet
# This is so Lmod can find Spack-generated modulefiles
#==============================================================================
if [[ ! "spack" =~ "${MODULEPATH}" ]]; then
    if [[ $- = *i* ]] ; then
	echo "... Updating module paths, please wait ..."
    fi
    export SPACK_MODULE_ROOT="${SPACK_ROOT}/share/spack/lmod/linux-rocky8-x86_64"
    export MODULEPATH+=":${SPACK_MODULE_ROOT}/Core"
    export MODULEPATH+=":${SPACK_MODULE_ROOT}/gcc/10.2.0"
    export MODULEPATH+=":${SPACK_MODULE_ROOT}/openmpi/4.1.0-62i34f7/gcc/10.2.0"
    export MODULEPATH+=":${SPACK_MODULE_ROOT}/gcc/12.2.0"
    export MODULEPATH+=":${SPACK_MODULE_ROOT}/openmpi/4.1.4-6yi53gp/gcc/12.2.0"
fi

#==============================================================================
# Unload all previously-unloaded software
#==============================================================================

# Unload packages loaded with "module load"
module purge

# Unload packages loaded with "spack load"
if [[ "x${SPACK_ROOT}" != "x" ]]; then
    spack unload --all
fi

#==============================================================================
# Load FASRC-built software packages for Rocky Linux and GNU 12.2.0
#==============================================================================
if [[ $- = *i* ]] ; then
    echo "... Loading FASRC-built software, please wait ..."
fi

# FASRC-built modules needed for GEOS-Chem
module load gcc/12.2.0-fasrc01             # gcc / g++ / gfortran
module load openmpi/4.1.4-fasrc01          # MPI
module load netcdf-c/4.9.2-fasrc01         # netcdf-c
module load netcdf-fortran/4.6.0-fasrc02   # netcdf-fortran
module load flex/2.6.4-fasrc01             # Flex lexer (needed for KPP)
module load cmake/3.25.2-fasrc01           # CMake (needed to compile)
module list
