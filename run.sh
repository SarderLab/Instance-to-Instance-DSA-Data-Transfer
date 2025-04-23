#!/bin/sh
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16gb
#SBATCH --time=120:00:00
#SBATCH --job-name="Luis_87:t0"
#SBATCH --partition="hpg2-compute"
echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR

echo "working directory = "$SLURM_SUBMIT_DIR
ulimit -s unlimited
module load singularity
module load pytorch
ls
ml

module load conda
conda activate SP_DataManagement

python transfer.py --src-api 'https://athena.rc.ufl.edu/api/v1' --dest-api 'https://dsa.rc.ufl.edu/api/v1' --src-user '' --dest-user '' --src-password '' --dest-password '' --src-path '/user/jingyixu/Public/Same_Section_WSIs_from_Dr_Clapp/HE/MCD' --dest-path '/user/jingyixu/Public/Same_Section_WSIs_from_Dr_Clapp/HE/MCD'

