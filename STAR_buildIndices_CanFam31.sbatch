#!/bin/bash
# Building a STAR index file for Can Fam 3.1 genome

#SBATCH --job-name=execute_STAR-build-CanFam31
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --time=12:00:00   # modify this to reflect how long to let the job go. This indicates 12 hours.
#SBATCH --qos=normal
#SBATCH --output=log_STAR-build_CanFam31_%J.txt
#SBATCH --mail-type=END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# make output directory
mkdir STAR_CanFam31_index

# Run STAR
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir ./STAR_CanFam31_index \
--genomeFastaFiles ./CanFam31/CanFam31_FullGenome.fa \
--sjdbGTFfile ./CanFam31/Canis_lupus_familiaris.CanFam3.1.104.gtf