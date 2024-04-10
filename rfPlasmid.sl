#!/bin/bash -e

#SBATCH --account       massey03727
#SBATCH --job-name      rfPlasmid
#SBATCH --time          12:10:00
#SBATCH --mem           20GB
#SBATCH --cpus-per-task 4
#SBATCH --error         %x_%j.err
#SBATCH --output        %x_%j.out

# Load modules
module purge
module load RFPlasmid/0.0.18-gimkl-2022a-Python-3.10.5

# Working directory
cd /nesi/nobackup/massey03727/MSc_manuscript/plasmid_analysis

#run rfPlasmid
rfplasmid --species Enterobacteriaceae --input rfPlasmid_in --threads 8 --out rfPlasmid_out