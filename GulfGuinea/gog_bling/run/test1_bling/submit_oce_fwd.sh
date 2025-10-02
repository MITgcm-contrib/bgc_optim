#!/bin/bash -l
# Account name to run under 
###SBATCH --partition=windfall
#SBATCH --account=jrussell
#SBATCH --partition=standard
#SBATCH --qos=qual_qos_jrussell
# a sensible name for the job
#SBATCH -J GoGdarwin3
# ask for N  full nodes
#SBATCH -N  2
#SBATCH --ntasks-per-node 6
### #SBATCH --exclusive       
###SBATCH --mem=432GB  
###SBATCH --switches=6
#SBATCH --mem-per-cpu=5500MB
# ask for 1 days and of run time
#SBATCH -t 1-01:00:00
#SBATCH --no-requeue

# Clear the environment from any previously loaded modules
###module purge > /dev/null 2>&1

# Load the module environment suitable for the job
module purge
module load phdf5-intel
module load netcdf-fortran/intel


ulimit -n 4096
cd /xdisk/jrussell/SOSE/angela/OMI/RUNS/test1_bling

echo "working directory = "$SLURM_SUBMIT_DIR
echo $PWD
echo "Launch "

mpirun -np 6 ./mitgcmuv > output.txt
