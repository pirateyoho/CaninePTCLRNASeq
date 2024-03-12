#!/bin/bash
# Running fastQC on multiple trimmed fastq files.

#SBATCH --job-name=execute_fastQC
#SBATCH --nodes=1
#SBATCH --ntasks=16 # modify this number to reflect how many cores you want to use (up to 32); make sure it matches the -t option below.
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=23:00:00
#SBATCH --output=log_FastQC_%J.txt
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# Run fastQC on all .fq files in the current directory.
fastqc -t 16 *.fq