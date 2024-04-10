#!/bin/bash -e

#SBATCH --account       massey03727
#SBATCH --job-name      panaroo
#SBATCH --time          24:10:00
#SBATCH --mem           5GB
#SBATCH --cpus-per-task 5
#SBATCH --error         %x_%j.err
#SBATCH --output        %x_%j.out

# Load modules
module purge
module load panaroo/1.3.0-gimkl-2022a-Python-3.10.5

# Working directory
cd /nesi/nobackup/massey03727/MSc_manuscript/plasmid_analysis/panaroo

# panaroo
panaroo -i gff_files/*.gff -o panaroo_pan_sensitive_results/ --clean-mode sensitive -a pan --aligner mafft --core_threshold 0.95 -t $SLURM_CPUS_PER_TASK