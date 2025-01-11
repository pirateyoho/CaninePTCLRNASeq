#!/bin/bash
# Running alignment job with STAR

#SBATCH --job-name=execute_STAR-mapping-to-CanFam31
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=shas
#SBATCH --qos=normal
#SBATCH --time=24:00:00
#SBATCH --output=log_STAR-mapping_%J.txt
#SBATCH --mail-type=END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

# Create an array of sample IDs for looping
SampleIDs="CI100641 CI100850 CI100993 CI101765 CI101786 CI103939 CI104029 CI104921 CI104999 CI105063 CI105392 CI107029 CI107031 CI107032 CI60342 CI63491 CI63500 CI65026 CI67283 CI67308 CI69996 CI71175 CI71312 CI71508 CI71605 CI71779 CI76055 CI76392 CI77877 CI80398 CI95512 CI95591 CI95593 CI96300 CI97074 CI97336 CI97568 CI97573 CI97578 CI98458"

for SampleID in $SampleIDs
do
    STAR \
    --runThreadN 8 \
    --outSAMtype BAM SortedByCoordinate \
    --quantMode GeneCounts \
    --outReadsUnmapped Fastx \
    --sjdbGTFfile ../indicesBuild/CanFam31_genomeFiles/Canis_lupus_familiaris.CanFam3.1.104.gtf \
    --genomeDir ../indicesBuild/STAR_CanFam31_index \
    --readFilesIn ../03_output/${SampleID}_trim_1.fq ../03_output/${SampleID}_trim_2.fq \
    --outFileNamePrefix ../03_output/220627_Alignment_to_CanFam31/${SampleID}
done