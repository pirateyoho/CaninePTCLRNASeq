#!/usr/bin/bash
 
# execute fastp on two paired-end reads of fastq files
 
# Initiate a bash array called SRRIDs with two elements
SampleIDs="100641 100850 100993 101765 101786 103939 104029 104921 104999 105063 105392 107029 107031 107032 60342 63491 63500 65026 67283 67308 69996 71175 71312 71508 71605 71779 76055 76392 77877 80398 95512 95591 95593 96300 97074 97336 97568 97573 97578 98458"
 
# Loop through the SSRID array and run fastp on each. Be sure to check file extension; replace .fq with .fastq in this script as needed.
for SampleID in $SampleIDs
do
     echo -e $SampleID
 
     fastp -i ../01_input/${SampleID}_1.fq\
     -I ../01_input/${SampleID}_2.fq\
     -o ../03_output/${SampleID}_trim_1.fq\
     -O ../03_output/${SampleID}_trim_2.fq\
     -h ../03_output/${SampleID}_report.html\
     -j ../03_output/${SampleID}_report.json\
     --detect_adapter_for_pe\
     --thread 1\
     -g -x -p
done