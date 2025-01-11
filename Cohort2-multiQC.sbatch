#!/bin/bash

#SBATCH --job-name=execute_multiQC
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 32)
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=4:00:00
#SBATCH --output=log_multiQC_%J.txt
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# Make output directory
mkdir ../04_output_new/multiQC

# Run multiQC. List the path to the directories where featureCounts summary files and STAR log files are stored, separated by a space.
multiqc ../04_output_new ../04_output_new/230601 -o ../04_output_new/multiQC # Directory where featureCounts summary files are stored
multiqc ../04_output_new -o ../04_output_new/STARmultiQC # Directory where STAR log files are stored
multiqc ../04_output_new 
