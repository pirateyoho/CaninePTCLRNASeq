# Background
This repository contains various bash scripts and R Markdown files utilized for an RNA-sequencing pipeline for 96 canine CD4+ PTCLs, 2 sorted control CD4+ thymocytes, and 5 sorted control CD4+ nodal lymphocytes.

# Description of scripts
Bash scripts (.sh and .sbatch) were run on the CURC Alpine supercomputer in a dedicated conda environment containing the software packages sra-tools, fastp, bedtools, samtools, star, fastqc, and multiqc. R Markdown documents were run in R Studio.

The order in which scripts were run was as follows:
1. fastp_withLooping.sbatch
2. The STAR_buildIndices.sbatch for the appropriate canine reference genome (CanFam 3.1, ROS Cfam 1.0, CanFam4, or CanFam6)
3. the STAR_alignReads.sbatch for the corresponding canine reference genome
4. tabulateCounts.sbatch
5. fastQC.sbatch
6. multiQC.sbatch
7. Bioconductor Package Install.Rmd
8. 2023-RNAseq-Analysis.Rmd
9. Various downstream analyses in R: clusterProfiler, hierarchical clustering, GSEA, GSVA, etc.
