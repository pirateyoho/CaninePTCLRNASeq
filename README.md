# Background
This repository details a bioinformatics pipeline utilized for RNA-sequencing analysis of two cohorts of canine PTCLs, sorted control canine CD4+ and CD8+ nodal lymphocytes, and sorted control canine CD4+ thymocytes.
## Pipeline
Bash scripts (.sh and .sbatch) were run on the CURC Alpine supercomputer in a dedicated conda environment containing the software packages sra-tools, fastp, bedtools, samtools, star, fastqc, and multiqc. R Markdown documents were run in R Studio.
## Overview of cohorts
| **Cohort**| **# CD4+ PTCLs** | **# CD8+ PTCLs**| **# DN PTCLs** | **# control nodal CD4+ lymphocytes** | **# control CD8+ lymphocytes** | **# control CD4+ thymocytes** | **Year sequencing performed** |
|:---------:|:----------------:|:---------------:|:--------------:|:------------------------------------:|:------------------------------:|:-----------------------------:|:-----------------------------:|
| 1         | 26               | 4               | 3              | 4                                    | 3                              | 0                             | 2019                          |
| 2         | 96               | 0               | 0              | 5                                    | 0                              | 2                             | 2023                          |

## Raw data
Raw fastq files are available from two CSU shared drives: the Nas drive for members of the Clinical Hematopathology Laboratory, or the Avery lab RSTOR shared drive.
### Nas
#### Cohort 1
M:\CHLab data\Sequencing Data\191106_PTCL_RNAseq_Harris\128.120.88.251\X202SC19091583-Z01-F001\rawdata
#### Cohort 2
M:\CHLab data\Sequencing Data\230517_CD4PTCL_RNASeq_Owens\01.RawData
### RStor
#### Cohort 1
O:\RSTOR-Avery\191106_PTCL_RNAseq_Harris\128.120.88.251\X202SC19091583-Z01-F001\rawdata
#### Cohort 2
O:\RSTOR-Avery\230517_CD4PTCL_RNASeq_Owens\01.RawData

## Pipeline overview
1. Adapters and low quality reads trimmed with fastp.
2. Acquisition of reference genome files from Ensembl and reference genome index builds with STAR.
3. Reads aligned to reference genome(s) with STAR.
4. Number of reads per gene tabulated by featureCounts.
5. QA/QC performed with fastqc and MultiQC.
6. Data normalization, principal component analysis, and differential gene expression analysis conducted with DESeq2.
7. Heatmaps and hierarchical clustering analysis performed with pheatmap.
8. Gene set enrichment analysis performed with clusterProfiler.
9. Gene set variation analysis performed with GSVA.

## Software
### Cohort 1
The following packages were installed into a conda (Anaconda, Inc.) environment on the CU Research Computing Summit High Performance Computing Cluster:


The following packages were installed and run in RStudio (version 0.13) using R (version 4.1.2):
| Name                 | Version |
| -------------------- | ------- |
| EnhancedVolcano      | 1.12.0  |
| forcats              | 0.5.1   |
| dplyr                | 1.0.9   |
| readr                | 2.1.2   |
| tibble               | 3.1.7   |
| tidyverse            | 1.3.1   |
| pheatmap             | 1.0.12  |
| corrplot             | 0.92    |
| SummarizedExperiment | 1.24.0  |
| MatrixGenerics       | 1.6.0   |
| GenomicRanges        | 1.46.1  |
| IRanges              | 2.28.0  |
| BiocGenerics         | 0.40.0  |
| ggrepel              | 0.9.1   |
| stringr              | 1.4.0   |
| purrr                | 0.3.4   |
| tidyr                | 1.2.0   |
| ggplot2              | 3.3.6   |
| apeglm               | 1.16.0  |
| RColorBrewer         | 1.1-3   |
| DESeq2               | 1.34.0  |
| Biobase              | 2.54.0  |
| matrixStats          | 0.62.0  |
| GenomeInfoDb         | 1.30.1  |
| S4Vectors            | 0.32.4  |

### Cohort 2
The following packages were installed into a conda (Anaconda, Inc.) environment on the CU Research Computing Alpine High Performance Computing Cluster:
| Name                      | Version      |
| ------------------------- | ------------ |
| _libgcc_mutex             | 0.1          |
| _openmp_mutex             | 4.5          |
| bbmap                     | 39.01        |
| bedtools                  | 2.31.0       |
| blast                     | 2.14.0       |
| bowtie                    | 1.0.0        |
| brotli                    | 1.0.9        |
| brotli-bin                | 1.0.9        |
| bwa                       | 0.7.17       |
| bzip2                     | 1.0.8        |
| c-ares                    | 1.19.1       |
| ca-certificates           | 2023.5.7     |
| cached-property           | 1.5.2        |
| cached_property           | 1.5.2        |
| certifi                   | 2023.5.7     |
| charset-normalizer        | 3.1.0        |
| click                     | 8.1.3        |
| coloredlogs               | 15.0.1       |
| colormath                 | 3.0.0        |
| contourpy                 | 1.0.7        |
| curl                      | 8.1.1        |
| cycler                    | 0.11.0       |
| dfam                      | 3.7          |
| entrez-direct             | 16.2         |
| expat                     | 2.5.0        |
| fastp                     | 0.23.3       |
| fastqc                    | 0.12.1       |
| font-ttf-dejavu-sans-mono | 2.37         |
| fontconfig                | 2.14.2       |
| fonttools                 | 4.39.4       |
| freetype                  | 2.12.1       |
| future                    | 0.18.3       |
| gettext                   | 0.21.1       |
| gmap                      | 2023.04.28   |
| h5py                      | 3.8.0        |
| hdf5                      | 1.14.0       |
| hisat2                    | 2.2.1        |
| hmmer                     | 3.3.2        |
| htslib                    | 1.17         |
| humanfriendly             | 10           |
| icu                       | 70.1         |
| idna                      | 3.4          |
| importlib-metadata        | 6.6.0        |
| isa-l                     | 2.30.0       |
| jinja2                    | 3.1.2        |
| keyutils                  | 1.6.1        |
| kiwisolver                | 1.4.4        |
| krb5                      | 1.20.1       |
| lcms2                     | 2.15         |
| ld_impl_linux-64          | 2.4          |
| lerc                      | 4.0.0        |
| libaec                    | 1.0.6        |
| libblas                   | 3.9.0        |
| libbrotlicommon           | 1.0.9        |
| libbrotlidec              | 1.0.9        |
| libbrotlienc              | 1.0.9        |
| libcblas                  | 3.9.0        |
| libcurl                   | 8.1.1        |
| libdb                     | 6.2.32       |
| libdeflate                | 1.18         |
| libedit                   | 3.1.20191231 |
| libev                     | 4.33         |
| libexpat                  | 2.5.0        |
| libffi                    | 3.4.2        |
| libgcc-ng                 | 12.2.0       |
| libgfortran-ng            | 12.2.0       |
| libgfortran5              | 12.2.0       |
| libgomp                   | 12.2.0       |
| libiconv                  | 1.17         |
| libidn2                   | 2.3.4        |
| libjpeg-turbo             | 2.1.5.1      |
| liblapack                 | 3.9.0        |
| libnghttp2                | 1.52.0       |
| libnsl                    | 2.0.0        |
| libopenblas               | 0.3.21       |
| libpng                    | 1.6.39       |
| libsqlite                 | 3.42.0       |
| libssh2                   | 1.10.0       |
| libstdcxx-ng              | 12.2.0       |
| libtiff                   | 4.5.0        |
| libunistring              | 0.9.10       |
| libuuid                   | 2.38.1       |
| libwebp-base              | 1.3.0        |
| libxcb                    | 1.15         |
| libxml2                   | 2.9.14       |
| libzlib                   | 1.2.13       |
| lzstring                  | 1.0.4        |
| markdown                  | 3.4.3        |
| markdown-it-py            | 2.2.0        |
| markupsafe                | 2.1.2        |
| matplotlib-base           | 3.7.1        |
| mdurl                     | 0.1.0        |
| multiqc                   | 1.14         |
| munkres                   | 1.0.7        |
| ncbi-vdb                  | 3.0.5        |
| ncurses                   | 6.3          |
| nettle                    | 3.8.1        |
| networkx                  | 3.1          |
| numpy                     | 1.24.3       |
| openjdk                   | 8.0.332      |
| openjpeg                  | 2.5.0        |
| openssl                   | 3.1.1        |
| ossuuid                   | 1.6.2        |
| packaging                 | 23.1         |
| pbzip2                    | 1.1.13       |
| pcre                      | 8.45         |
| perl                      | 5.32.1       |
| perl-alien-build          | 2.48         |
| perl-alien-libxml2        | 0.17         |
| perl-archive-tar          | 2.4          |
| perl-business-isbn        | 3.007        |
| perl-business-isbn-data   | 20210112     |
| perl-capture-tiny         | 0.48         |
| perl-carp                 | 1.38         |
| perl-common-sense         | 3.75         |
| perl-compress-raw-bzip2   | 2.201        |
| perl-compress-raw-zlib    | 2.105        |
| perl-constant             | 1.33         |
| perl-data-dumper          | 2.183        |
| perl-db-file              | 1.855        |
| perl-encode               | 3.19         |
| perl-exporter             | 5.72         |
| perl-exporter-tiny        | 1.002002     |
| perl-extutils-makemaker   | 7.7          |
| perl-ffi-checklib         | 0.28         |
| perl-file-chdir           | 0.101        |
| perl-file-path            | 2.18         |
| perl-file-temp            | 0.2304       |
| perl-file-util            | 4.20172      |
| perl-file-which           | 1.24         |
| perl-importer             | 0.026        |
| perl-io-compress          | 2.201        |
| perl-io-gzip              | 0.2          |
| perl-io-zlib              | 1.14         |
| perl-json                 | 4.1          |
| perl-json-xs              | 2.34         |
| perl-lib                  | 0.63         |
| perl-list-moreutils       | 0.43         |
| perl-list-moreutils-xs    | 0.43         |
| perl-mime-base64          | 3.16         |
| perl-parent               | 0.236        |
| perl-path-tiny            | 0.122        |
| perl-pathtools            | 3.75         |
| perl-scalar-list-utils    | 1.62         |
| perl-scope-guard          | 0.21         |
| perl-set-intervaltree     | 0.12         |
| perl-sub-info             | 0.002        |
| perl-term-table           | 0.016        |
| perl-test2-suite          | 0.000145     |
| perl-types-serialiser     | 1.01         |
| perl-uri                  | 5.12         |
| perl-xml-libxml           | 2.0207       |
| perl-xml-namespacesupport | 1.12         |
| perl-xml-sax              | 1.02         |
| perl-xml-sax-base         | 1.09         |
| pillow                    | 9.5.0        |
| pip                       | 23.1.2       |
| pthread-stubs             | 0.4          |
| pygments                  | 2.15.1       |
| pyparsing                 | 3.0.9        |
| pysocks                   | 1.7.1        |
| python                    | 3.10.0       |
| python-dateutil           | 2.8.2        |
| python-wget               | 3.2          |
| python_abi                | 3.1          |
| pyyaml                    | 6            |
| readline                  | 8.2          |
| repeatmasker              | 4.1.5        |
| requests                  | 2.31.0       |
| rich                      | 13.4.1       |
| rich-click                | 1.6.1        |
| rmblast                   | 2.14.0       |
| samtools                  | 1.17         |
| setuptools                | 67.7.2       |
| simplejson                | 3.19.1       |
| singularity               | 3.6.4        |
| six                       | 1.16.0       |
| spectra                   | 0.0.11       |
| sqlite                    | 3.42.0       |
| sra-tools                 | 3.0.5        |
| star                      | 2.7.10b      |
| star-fusion               | 1.12.0       |
| subread                   | 2.0.3        |
| tk                        | 8.6.12       |
| trf                       | 4.09.1       |
| typing_extensions         | 4.6.3        |
| tzdata                    | 2023c        |
| unicodedata2              | 15.0.0       |
| urllib3                   | 2.0.2        |
| wget                      | 1.20.3       |
| wheel                     | 0.40.0       |
| xorg-libxau               | 1.0.11       |
| xorg-libxdmcp             | 1.1.3        |
| xz                        | 5.2.6        |
| yaml                      | 0.2.5        |
| zipp                      | 3.15.0       |
| zlib                      | 1.2.13       |
| zstd                      | 1.5.2        |

The following packages were installed and run in RStudio (version 0.14) using R (version 4.4.2):
| Name                 | Version |
| -------------------- | ------- |
| EnhancedVolcano      | 1.16.0  |
| enrichplot           | 1.18.3  |
| forcats              | 1.0.0   |
| dplyr                | 1.1.0   |
| readr                | 2.1.4   |
| tibble               | 3.1.8   |
| tidyverse            | 1.3.2   |
| pheatmap             | 1.0.12  |
| corrplot             | 0.92    |
| SummarizedExperiment | 1.28.0  |
| MatrixGenerics       | 1.10.0  |
| GenomicRanges        | 1.50.2  |
| IRanges              | 2.32.0  |
| BiocGenerics         | 0.44.0  |
| ggrepel              | 0.9.3   |
| clusterProfiler      | 4.6.0   |
| stringr              | 1.5.0   |
| purrr                | 1.0.1   |
| tidyr                | 1.3.0   |
| ggplot2              | 3.4.1   |
| apeglm               | 1.20.0  |
| RColorBrewer         | 1.1-3   |
| DESeq2               | 1.38.3  |
| Biobase              | 2.58.0  |
| matrixStats          | 0.63.0  |
| GenomeInfoDb         | 1.34.9  |
| S4Vectors            | 0.36.1  |
