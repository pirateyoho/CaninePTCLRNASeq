#!/bin/bash
# Building a STAR index file for ROS CFam 1.0 genome

#SBATCH --job-name=execute_STAR-build-ROSCFam1
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --time=12:00:00   # modify this to reflect how long to let the job go. This indicates 12 hours.
#SBATCH --qos=normal
#SBATCH --output=log_STAR-build_ROSCFam1_%J.txt
#SBATCH --mail-type=END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# make output directory
mkdir STAR_ROSCFam1_index

# Run STAR
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir ./STAR_ROSCFam1_index \
--genomeFastaFiles ./ROS_CFam_1/ROSCFam1_FullGenome.fa \
--sjdbGTFfile ./ROS_CFam_1/Canis_lupus_familiaris.ROS_Cfam_1.0.109.gtf