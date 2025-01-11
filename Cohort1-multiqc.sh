#!/bin/bash

#SBATCH --job-name=execute_multiQC
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --partition=shas
#SBATCH --qos=normal
#SBATCH --time=4:00:00
#SBATCH --output=log_multiQC_%J.txt
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# Make output directory
mkdir ../03_output/multiQC

# Run multiQC to summarize featureCounts and STAR log files
multiqc ../03_output