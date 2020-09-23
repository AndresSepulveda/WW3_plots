#!/bin/bash
module load intel/2019b
module load HDF5
module load netCDF
module load netCDF-Fortran
module load impi
export NETCDF_CONFIG=$(which nc-config)
export WWATCH3_NETCDF=NC4
