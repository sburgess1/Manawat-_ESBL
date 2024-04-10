#!/bin/bash -e
#SBATCH --account       massey03727
#SBATCH --job-name      plasmid_prokka
#SBATCH --time          05:10:00
#SBATCH --mem           5GB
#SBATCH --cpus-per-task 5
#SBATCH --error         %x_%j.err
#SBATCH --output        %x_%j.out

module purge

module load nullarbor/2.0.20191013

for file in *_contigs.fasta_plasmid_contigs.fasta; do tag=${file%_contigs.fasta_plasmid_contigs.fasta}; prokka --prefix "$tag" --locustag "$tag"  --cpus 4  --genus Escherichia  --outdir "$tag"_prokka --force --addgenes "$file"; done