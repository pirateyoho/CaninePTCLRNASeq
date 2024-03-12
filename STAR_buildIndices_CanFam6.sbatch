#!/bin/bash
# Building a STAR index file for CanFam6 genome

#SBATCH --job-name=execute_STAR-build-CanFam6
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --time=12:00:00   # modify this to reflect how long to let the job go. This indicates 12 hours.
#SBATCH --qos=normal
#SBATCH --output=log_STAR-build_CanFam6_%J.txt
#SBATCH --mail-type=END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# make output directory
mkdir STAR_CanFam6_index

# Run STAR
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir ./STAR_CanFam6_index \
--genomeFastaFiles ./CanFam6/CanFam6_FullGenome.fa \
--sjdbGTFfile ./CanFam6/Canis_lupus_familiarisboxer.Dog10K_Boxer_Tasha.109.gtf