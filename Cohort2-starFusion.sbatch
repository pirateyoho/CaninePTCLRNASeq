#!/bin/bash
# Running fusion transcript detection with STAR-Fusion

#SBATCH --job-name=execute_STARFusion
#SBATCH --nodes=1
#SBATCH --ntasks=24 # modify this number to reflect how many cores you want to use (up to 32)
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=23:00:00
#SBATCH --output=log_STAR-fusion_%J.txt
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# Create an array of sample IDs for looping.
SampleIDs="CI100641 CI100850 CI100993 … etc." # Space delimited list of sample IDs in quotations.

# Run STAR-Fusion, looping through each sample. Adjust pathways as needed.

for SampleID in $SampleIDs
do
# make output directory
mkdir ../03_output/STARFusion/${SampleID}

STAR-Fusion \
--genome_lib_dir ../indicesBuild/path-to-STAR-index-directory \
--CPU 24 \
--left_fq ../03_output/${SampleID}_trim_1.fq \
--right_fq ../03_output/${SampleID}_trim_2.fq \
--output_dir ../03_output/STARFusion/${SampleID}
done
