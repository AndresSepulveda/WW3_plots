#!/bin/bash
#SBATCH --job-name="AS_VALPO"
#SBATCH --partition="slims"
#SBATCH	-n 120
#SBATCH --ntasks-per-node=20
#SBATCH --output=ww3_shel.out
#SBATCH --error=ww3_shel.err
#SBATCH --mail-user=andres.sepulveda@gmail.com
#SBATCH --mail-type=ALL

module load intel impi

export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
export I_MPI_FABRICS=shm:tcp


	srun ww3_shel #> ww3_shel.out


