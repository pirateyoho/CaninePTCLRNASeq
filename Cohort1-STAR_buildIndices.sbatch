#!/bin/bash
# Building a STAR index file

#SBATCH --job-name=execute_STAR-build
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=shas-testing
#SBATCH --qos=testing     # modify this to reflect which queue you want to use. Options are 'normal' and 'testing'
#SBATCH --time=0:29:00   # modify this to reflect how long to let the job go. This indicates 29 minutes.
#SBATCH --output=log_STAR-build_%J.txt

# make output directory
mkdir STAR_CanFam31_index

# Run STAR
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir ./STAR_CanFam31_index \
--genomeFastaFiles ./CanFam31_genomeFiles/concatenatedCanFam31Genome.fa \
--sjdbGTFfile ./CanFam31_genomeFiles/Canis_lupus_familiaris.CanFam3.1.104.gtf