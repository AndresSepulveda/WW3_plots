#!/bin/bash
#SBATCH -J f_aysen_MPI
#SBATCH -p slims
#SBATCH -n 40
#SBATCH --mem-per-cpu=2400
#SBATCH --ntasks-per-node=20
#SBATCH --mem=48000
#SBATCH --output=ww3_shel.out
#SBATCH --error=ww3_shel.err
#SBATCH --mail-user=diegomanuel2210@gmail.com
#SBATCH --mail-type=ALL

ml purge
ml load intel/2019b HDF5 netCDF netCDF-Fortran impi

/home/asepulveda/WW3/exe_aysen_MPI/ww3_grid > ww3_grid.out
/home/asepulveda/WW3/exe_aysen_MPI/ww3_strt > ww3_strt.out
/home/asepulveda/WW3/exe_aysen_MPI/ww3_bounc > ww3_bounc.out
srun /home/asepulveda/WW3/exe_aysen_MPI/ww3_shel
