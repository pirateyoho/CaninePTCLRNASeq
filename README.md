# Bulk RNA-sequencing of canine PTCL
## Background
This repository details a bioinformatics pipeline utilized for RNA-sequencing analysis of two cohorts of canine PTCLs, sorted control canine CD4+ and CD8+ nodal lymphocytes, and sorted control canine CD4+ thymocytes.
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
10. Fusion calling with STAR-Fusion (Cohort 2 only).
## Overview of cohorts
### Summary
| **Cohort**| **# CD4+ PTCLs** | **# CD8+ PTCLs**| **# DN PTCLs** | **# control nodal CD4+ lymphocytes** | **# control CD8+ lymphocytes** | **# control CD4+ thymocytes** | **Year RNA-sequencing performed** |
|:---------:|:----------------:|:---------------:|:--------------:|:------------------------------------:|:------------------------------:|:-----------------------------:|:---------------------------------:|
| 1         | 26               | 4               | 3              | 4                                    | 3                              | 0                             | 2019                              |
| 2         | 96               | 0               | 0              | 5                                    | 0                              | 2                             | 2023                              |
### Details
| Avery lab number | Sample name | Experiment group                        | Breed                         | Sex            | Age (yrs) | Sample location        |
| ---------------- | ----------- | --------------------------------------- | ----------------------------- | -------------- | --------- | ---------------------- |
| 100641           | CF01        | Cohort 1 CD4+ PTCL                      | Miniature Australian Shepherd | Male Castrated | 5         | Lymph Node             |
| 100850           | CF02        | Cohort 1 CD4+ PTCL                      | Shih Tzu                      | Male Castrated | 11        | Lymph Node             |
| 100993           | CF03        | Cohort 1 CD4+ PTCL                      | Boxer                         | Female Spayed  | 9         | Lymph Node             |
| 101765           | CF04        | Cohort 1 CD8+ PTCL                      | Mixed breed                   | Female Spayed  | 12        | Lymph Node             |
| 101786           | CF05        | Cohort 1 CD4+ PTCL                      | Golden Retriever              | Female Spayed  | 10        | Lymph Node             |
| 103939           | CF06        | Cohort 1 CD8+ PTCL                      | Mixed breed                   | Male Castrated | 5         | Lymph Node             |
| 104029           | CF07        | Cohort 1 CD4+ PTCL                      | Mixed breed                   | Male Castrated | 11        | Lymph Node             |
| 104921           | CF08        | Cohort 1 CD4-CD8- PTCL                  | Cocker Spaniel                | Female Spayed  | 3         | Lymph Node             |
| 104999           | CF09        | Cohort 1 CD4-CD8- PTCL                  | Mixed breed                   | Female Spayed  | 4         | Lymph Node             |
| 105063           | CF10        | Cohort 1 CD8+ PTCL                      | Mixed breed                   | Female Spayed  | 13        | Lymph Node             |
| 105392           | CF11        | Cohort 1 CD8+ PTCL                      | Lhasa Apso                    | Male Castrated | Unknown   | Lymph Node             |
| 107029           | CF12        | Cohort 1 Control CD4+ nodal lymphocytes | Beagle, Beagle                | Male, Female   | 1, 1      | Lymph Node             |
| 107031           | CF13        | Cohort 1 Control CD8+ nodal lymphocytes | Hound, Hound                  | Female, Female | 1, 1      | Lymph Node             |
| 107032           | CF14        | Cohort 1 Control CD8+ nodal lymphocytes | Hound, Hound                  | Female, Female | 1, 1      | Lymph Node             |
| 60342            | CF15        | Cohort 1 CD4+ PTCL                      | Mixed breed                   | Male Castrated | 6         | Lymph Node             |
| 63491            | CF16        | Cohort 1 Control CD8+ nodal lymphocytes | Hound                         | Female         | 1         | Lymph Node             |
| 63500            | CF17        | Cohort 1 Control CD4+ nodal lymphocytes | Hound                         | Female         | 1         | Lymph Node             |
| 65026            | CF18        | Cohort 1 CD4+ PTCL                      | Boxer                         | Male Castrated | 5         | Lymph Node             |
| 67283            | CF19        | Cohort 1 CD4+ PTCL                      | Boxer                         | Female Spayed  | 4         | Mediastinum            |
| 67308            | CF20        | Cohort 1 CD4+ PTCL                      | German Shepherd               | Female Spayed  | 6         | Bone Marrow            |
| 69996            | CF21        | Cohort 1 CD4+ PTCL                      | Labrador Retriever            | Male Castrated | 7         | Mediastinum            |
| 71175            | CF22        | Cohort 1 CD4+ PTCL                      | Chesapeake Bay Retriever      | Male Castrated | 7         | Lymph Node             |
| 71312            | CF23        | Cohort 1 CD4+ PTCL                      | Golden Retriever              | Male Castrated | 10        | Lymph Node             |
| 71508            | CF24        | Cohort 1 CD4+ PTCL                      | Rhodesian Ridgeback           | Male Castrated | 3         | Mediastinum            |
| 71605            | CF25        | Cohort 1 CD4+ PTCL                      | Golden Retriever              | Male Castrated | 4         | Lymph Node             |
| 71779            | CF26        | Cohort 1 CD4+ PTCL                      | Dogue de Bordeaux             | Male Castrated | 5         | Lymph Node             |
| 76055            | CF27        | Cohort 1 CD4+ PTCL                      | Boxer                         | Male Castrated | 9         | Lymph Node             |
| 76392            | CF28        | Cohort 1 CD4+ PTCL                      | Boxer                         | Female Spayed  | 10        | Lymph Node             |
| 77877            | CF29        | Cohort 1 Control CD4+ nodal lymphocytes | Beagle                        | Male           | 1         | Lymph Node             |
| 80398            | CF30        | Cohort 1 Control CD4+ nodal lymphocytes | Mixed breed                   | Female         | 1         | Lymph Node             |
| 95512            | CF31        | Cohort 1 CD4+ PTCL                      | Mixed breed                   | Male Castrated | 6         | Lymph Node             |
| 95591            | CF32        | Cohort 1 CD4+ PTCL                      | Golden Doodle                 | Male Castrated | 10        | Lymph Node             |
| 95593            | CF33        | Cohort 1 CD4+ PTCL                      | Boxer                         | Male Castrated | 7         | Lymph Node             |
| 96300            | CF34        | Cohort 1 CD4+ PTCL                      | Golden Retriever              | Male Castrated | 5         | Lymph Node             |
| 97074            | CF35        | Cohort 1 CD4+ PTCL                      | Mixed breed                   | Male Castrated | 10        | Lymph Node             |
| 97336            | CF36        | Cohort 1 CD4+ PTCL                      | Golden Retriever              | Male Castrated | 4         | Lymph Node             |
| 97568            | CF37        | Cohort 1 CD4+ PTCL                      | Australian Shepherd           | Male Castrated | 10        | Lymph Node             |
| 97573            | CF38        | Cohort 1 CD4-CD8- PTCL                  | Pomeranian                    | Male Castrated | 11        | Lymph Node             |
| 97578            | CF39        | Cohort 1 CD4+ PTCL                      | Shetland Sheepdog             | Male Castrated | 8         | Lymph Node             |
| 98458            | CF40        | Cohort 1 CD4+ PTCL                      | Presa Canario                 | Female Spayed  | 5         | Lymph Node             |
| 80411            | CF41        | Thymus Control                          | Mixed breed                   | Female         | 1         | Thymus                 |
| 80416            | CF42        | Thymus Control                          | Mixed breed                   | Female         | 1         | Thymus                 |
| 90971            | CF43        | Thymus Control                          | Mixed breed                   | Female         | 1         | Thymus                 |
| 90972            | CF44        | Thymus Control                          | Mixed breed                   | Female         | 1         | Thymus                 |
| 90973            | CF45        | Thymus Control                          | Mixed breed                   | Female         | 1         | Thymus                 |
| 90974            | CF46        | Thymus Control                          | Mixed breed                   | Female         | 1         | Thymus                 |
| 144035           | CF47        | Thymus Control                          | Mixed breed                   | Female         | 2         | Thymus                 |
| 156596           | CF48        | Thymus Control                          | Mixed breed                   | Female         | 0.58      | Thymus                 |
| 101495           | CF49        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 8         | Lymph node             |
| 102794           | CF50        | Cohort 2 CD4+ PTCL                      | PAP                           | MC             | 11        | Mediastinum            |
| 104568           | CF51        | Cohort 2 CD4+ PTCL                      | Australian Shepherd           | FS             | 5         | Lymph node             |
| 104569           | CF52        | Cohort 2 CD4+ PTCL                      | ECCKS                         | FS             | 6         | Lymph node             |
| 104689           | CF53        | Cohort 2 CD4+ PTCL                      | BOYSP                         | M              | 6         | Lymph node             |
| 105160           | CF54        | Cohort 2 CD4+ PTCL                      | Labrador retriever            | M              | 4         | Lymph node             |
| 105374           | CF55        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 2         | Lymph node             |
| 105488           | CF56        | Cohort 2 CD4+ PTCL                      | YORK                          | MC             | 7         | Lymph node             |
| 105552           | CF57        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 12        | Lymph node             |
| 105669           | CF58        | Cohort 2 CD4+ PTCL                      | Golden retriever              | MC             | 7         | Lymph node             |
| 105719           | CF59        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 5         | Lymph node             |
| 105729           | CF60        | Cohort 2 CD4+ PTCL                      | Golden retriever              | MC             | 5         | Lymph node             |
| 105804           | CF61        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 4         | Lymph node             |
| 105835           | CF62        | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 7         | Lymph node             |
| 106316           | CF63        | Cohort 2 CD4+ PTCL                      | Australian Shepherd           | MC             | 5         | Lymph node             |
| 106347           | CF64        | Cohort 2 CD4+ PTCL                      | STBN                          | MC             | 9         | Lymph node             |
| 106392           | CF65        | Cohort 2 CD4+ PTCL                      | BCOL                          | MC             | 7         | Lymph node             |
| 106419           | CF66        | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 4         | Lymph node             |
| 124711           | CF67        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 6         | Lymph node             |
| 124777           | CF68        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 6         | Lymph node             |
| 124799           | CF69        | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 7         | Lymph node             |
| 124809           | CF70        | Cohort 2 CD4+ PTCL                      | Boxer                         | F              | 4         | Lymph node             |
| 149694           | CF71        | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 7         | Lymph node             |
| 149695           | CF72        | Cohort 2 CD4+ PTCL                      | OESD                          | FS             | 4         | Lymph node             |
| 150394           | CF73        | Cohort 2 CD4+ PTCL                      | Labradoodle                   | MC             | 5         | Lymph node             |
| 150689           | CF74        | Cohort 2 CD4+ PTCL                      | German Shepherd               | MC             | 7         | Lymph node             |
| 150972           | CF75        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 6         | Lymph node             |
| 151879           | CF76        | Cohort 2 CD4+ PTCL                      | PBT                           | MC             | 5         | Lymph node             |
| 152043           | CF77        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 4         | Lymph node             |
| 152139           | CF78        | Cohort 2 CD4+ PTCL                      | SPRSP                         | MC             | 6         | Lymph node             |
| 152256           | CF79        | Cohort 2 CD4+ PTCL                      | HUS                           | MC             | 4         | Lymph node             |
| 152603           | CF80        | Cohort 2 CD4+ PTCL                      | Australian Shepherd           | MC             | 9         | Lymph node             |
| 152610           | CF81        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 5         | Lymph node-mesenteric  |
| 152824           | CF82        | Cohort 2 CD4+ PTCL                      | BMSTF                         | F              | 4         | Lymph node             |
| 152837           | CF83        | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 4         | Lymph node             |
| 153051           | CF84        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 6         | Lymph node             |
| 153070           | CF85        | Cohort 2 CD4+ PTCL                      | CORG                          | FS             | 8         | Lymph node             |
| 153316           | CF86        | Cohort 2 CD4+ PTCL                      | Golden doodle                 | FS             | 6         | Lymph node             |
| 153427           | CF87        | Cohort 2 CD4+ PTCL                      | AMSTAFF                       | MC             | 3         | Lymph node             |
| 153429           | CF88        | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 5         | Lymph node             |
| 154958           | CF89        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 8         | Lymph node             |
| 154980           | CF90        | Cohort 2 CD4+ PTCL                      | SHTZ                          | MC             | 9         | Lymph node             |
| 155416           | CF91        | Cohort 2 CD4+ PTCL                      | ENGST                         | F              | 5         | Lymph node             |
| 155427           | CF92        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 6         | Lymph node             |
| 155939           | CF93        | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 8         | Lymph node             |
| 156336           | CF94        | Cohort 2 CD4+ PTCL                      | CAT                           | MC             | 7         | Lymph node-mesenteric  |
| 156355           | CF95        | Cohort 2 CD4+ PTCL                      | Golden retriever              | M              | 5         | Mediastinum            |
| 158400           | CF96        | Cohort 2 CD4+ PTCL                      | AIR                           | MC             | 10        | Lymph node             |
| 158477           | CF97        | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 6         | Lymph node             |
| 158538           | CF98        | Cohort 2 CD4+ PTCL                      | CCRSO                         | MC             | 10        | Lymph node             |
| 158606           | CF99        | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 7         | Lymph node             |
| 158821           | CF100       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 6         | Lymph node             |
| 159153           | CF101       | Cohort 2 CD4+ PTCL                      | Labrador retriever            | FS             | 10        | Lymph node             |
| 160115           | CF102       | Cohort 2 CD4+ PTCL                      | Golden doodle                 | MC             | 4         | Lymph node             |
| 160275           | CF103       | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 10        | Lymph node             |
| 161206           | CF104       | Cohort 2 CD4+ PTCL                      | WEIM                          | FS             | 5         | Lymph node             |
| 161277           | CF105       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 5         | Lymph node             |
| 161398           | CF106       | Cohort 2 CD4+ PTCL                      | German Shepherd               | FS             | 10        | Lymph node             |
| 162673           | CF107       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 7         | Lymph node             |
| 163077           | CF108       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 10        | Lymph node             |
| 163081           | CF109       | Cohort 2 CD4+ PTCL                      | Australian ShepherdCD         | MC             | 4         | Lymph node             |
| 163085           | CF110       | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 5         | Lymph node             |
| 164032           | CF111       | Cohort 2 CD4+ PTCL                      | YORK                          | FS             | 9         | Lymph node             |
| 164076           | CF112       | Cohort 2 CD4+ PTCL                      | CORG                          | MC             | 5         | Lymph node-mediastinal |
| 164535           | CF113       | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 4         | Lymph node             |
| 164787           | CF114       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 11        | Lymph node             |
| 164790           | CF115       | Cohort 2 CD4+ PTCL                      | Australian Shepherd           | FS             | 5         | Lymph node             |
| 164860           | CF116       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 5         | Lymph node             |
| 164934           | CF117       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 8         | Lymph node             |
| 164968           | CF118       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 3         | Lymph node             |
| 165162           | CF119       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 8         | Lymph node             |
| 165189           | CF120       | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 7         | Lymph node             |
| 165411           | CF121       | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 5         | Lymph node             |
| 165426           | CF122       | Cohort 2 CD4+ PTCL                      | Golden retriever              | FS             | 6         | Lymph node             |
| 165577           | CF123       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 8         | Lymph node             |
| 165644           | CF124       | Cohort 2 CD4+ PTCL                      | BLHRL                         | FS             | 4         | Lymph node             |
| 165769           | CF125       | Cohort 2 CD4+ PTCL                      | PBT                           | FS             | 3         | Lymph node             |
| 165776           | CF126       | Cohort 2 CD4+ PTCL                      | BLLDAM                        | FS             | 5         | Lymph node             |
| 166151           | CF127       | Cohort 2 CD4+ PTCL                      | GLD                           | MC             | 8         | Lymph node             |
| 166393           | CF128       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 7         | Lymph node             |
| 166465           | CF129       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 7         | Lymph node             |
| 166472           | CF130       | Cohort 2 CD4+ PTCL                      | Australian Shepherd           | MC             | 12        | Lymph node             |
| 166556           | CF131       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 13        | Lymph node             |
| 166625           | CF132       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 8         | Lymph node             |
| 167185           | CF133       | Cohort 2 CD4+ PTCL                      | Boxer                         | FS             | 6         | Lymph node             |
| 169715           | CF134       | Cohort 2 CD4+ PTCL                      | OESD                          | MC             | 3         | Lymph node             |
| 171323           | CF135       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 4         | Lymph node             |
| 171436           | CF136       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | MC             | 5         | Lymph node             |
| 171487           | CF137       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 7         | Lymph node             |
| 171535           | CF138       | Cohort 2 CD4+ PTCL                      | Golden doodle                 | FS             | 8         | Lymph node             |
| 171729           | CF139       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | FS             | 6         | Lymph node             |
| 171788           | CF140       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 9         | Lymph node             |
| 171792           | CF141       | Cohort 2 CD4+ PTCL                      | Boxer                         | MC             | 11        | Lymph node             |
| 171818           | CF142       | Cohort 2 CD4+ PTCL                      | NEWFIE                        | MC             | 4         | Lymph node             |
| 171906           | CF143       | Cohort 2 CD4+ PTCL                      | Mixed breed                   | M-             | 5         | Lymph node             |
| 172331           | CF144       | Cohort 2 CD4+ PTCL                      | Golden doodle                 | MC             | 7         | Lymph node             |
| 80397            | CF145       | Cohort 2 Control CD4+ nodal lymphocytes | Mixed breed                   | Female         | 1         | Lymph node             |
| 80399            | CF146       | Cohort 2 Control CD4+ nodal lymphocytes | Mixed breed                   | Female         | 1         | Lymph node             |
| 80400            | CF147       | Cohort 2 Control CD4+ nodal lymphocytes | Mixed breed                   | Female         | 1         | Lymph node             |
| 156615           | CF148       | Cohort 2 Control CD4+ thymocytes        | Mixed breed                   | Female         | 0.66      | Thymus                 |
| 156616           | CF149       | Cohort 2 Control CD4+ nodal lymphocytes | Mixed breed                   | Female         | 0.66      | Lymph node             |
| 157907           | CF150       | Cohort 2 Control CD4+ nodal lymphocytes | Mixed breed                   | Female         | 0.73      | Lymph node             |
| 157953           | CF151       | Cohort 2 Control CD4+ thymocytes        | Mixed breed                   | Female         | 0.73      | Thymus                 |

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

## Software
### Cohort 1
The following packages were installed into a conda (Anaconda, Inc.) environment on the CU Research Computing Summit High Performance Computing Cluster:
| Name                      | Version      | Build               | Channel     |
| ------------------------- | ------------ | ------------------- | ----------- |
| _libgcc_mutex             | 0.1          | conda_forge         | conda-forge |
| _openmp_mutex             | 4.5          | 1_gnu               | conda-forge |
| bedtools                  | 2.30.0       | h7d7f7ad_1          | bioconda    |
| brotli                    | 1.0.9        | h7f98852_6          | conda-forge |
| brotli-bin                | 1.0.9        | h7f98852_6          | conda-forge |
| bwa                       | 0.7.17       | h5bf99c6_8          | bioconda    |
| bzip2                     | 1.0.8        | h7f98852_4          | conda-forge |
| c-ares                    | 1.18.1       | h7f98852_0          | conda-forge |
| ca-certificates           | 2022.6.15    | ha878542_0          | conda-forge |
| certifi                   | 2022.6.15    | py38h578d9bd_0      | conda-forge |
| charset-normalizer        | 2.0.9        | pypi_0              | pypi        |
| click                     | 8.0.3        | pypi_0              | pypi        |
| colorama                  | 0.4.4        | pypi_0              | pypi        |
| coloredlogs               | 15.0.1       | pypi_0              | pypi        |
| colormath                 | 3.0.0        | pypi_0              | pypi        |
| commonmark                | 0.9.1        | pypi_0              | pypi        |
| curl                      | 7.80.0       | h2574ce0_0          | conda-forge |
| cycler                    | 0.11.0       | pyhd8ed1ab_0        | conda-forge |
| deeptools                 | 3.5.1        | py_0                | bioconda    |
| deeptoolsintervals        | 0.1.9        | py38h4a8c8d9_3      | bioconda    |
| fastp                     | 0.23.1       | h79da9fb_0          | bioconda    |
| fonttools                 | 4.28.3       | py38h497a2fe_0      | conda-forge |
| freetype                  | 2.10.4       | h0708190_1          | conda-forge |
| future                    | 0.18.2       | pypi_0              | pypi        |
| hdf5                      | 1.10.6       | nompi_h6a2412b_1114 | conda-forge |
| hisat2                    | 2.2.1        | h1b792b2_3          | bioconda    |
| htslib                    | 1.14         | h9093b5e_0          | bioconda    |
| humanfriendly             | 10           | pypi_0              | pypi        |
| icu                       | 69.1         | h9c3ff4c_0          | conda-forge |
| idna                      | 3.3          | pypi_0              | pypi        |
| importlib-metadata        | 4.8.2        | pypi_0              | pypi        |
| isa-l                     | 2.30.0       | ha770c72_4          | conda-forge |
| jbig                      | 2.1          | h7f98852_2003       | conda-forge |
| jinja2                    | 3.0.3        | pypi_0              | pypi        |
| jpeg                      | 9d           | h36c2ea0_0          | conda-forge |
| kiwisolver                | 1.3.2        | py38h1fd1430_1      | conda-forge |
| krb5                      | 1.19.2       | hcc1bbae_3          | conda-forge |
| lcms2                     | 2.12         | hddcbb42_0          | conda-forge |
| lerc                      | 2.2.1        | h9c3ff4c_0          | conda-forge |
| libblas                   | 3.9.0        | 12_linux64_openblas | conda-forge |
| libbrotlicommon           | 1.0.9        | h7f98852_6          | conda-forge |
| libbrotlidec              | 1.0.9        | h7f98852_6          | conda-forge |
| libbrotlienc              | 1.0.9        | h7f98852_6          | conda-forge |
| libcblas                  | 3.9.0        | 12_linux64_openblas | conda-forge |
| libcurl                   | 7.80.0       | h2574ce0_0          | conda-forge |
| libdeflate                | 1.7          | h7f98852_5          | conda-forge |
| libedit                   | 3.1.20191231 | he28a2e2_2          | conda-forge |
| libev                     | 4.33         | h516909a_1          | conda-forge |
| libffi                    | 3.2.1        | he1b5a44_1007       | conda-forge |
| libgcc                    | 7.2.0        | h69d50b8_2          | conda-forge |
| libgcc-ng                 | 11.2.0       | h1d223b6_11         | conda-forge |
| libgfortran-ng            | 11.2.0       | h69a702a_11         | conda-forge |
| libgfortran5              | 11.2.0       | h5c6108e_11         | conda-forge |
| libgomp                   | 11.2.0       | h1d223b6_11         | conda-forge |
| libiconv                  | 1.16         | h516909a_0          | conda-forge |
| liblapack                 | 3.9.0        | 12_linux64_openblas | conda-forge |
| libnghttp2                | 1.43.0       | h812cca2_1          | conda-forge |
| libopenblas               | 0.3.18       | pthreads_h8fe5266_0 | conda-forge |
| libpng                    | 1.6.37       | h21135ba_2          | conda-forge |
| libssh2                   | 1.10.0       | ha56f1ee_2          | conda-forge |
| libstdcxx-ng              | 11.2.0       | he4da1e4_11         | conda-forge |
| libtiff                   | 4.3.0        | hf544144_1          | conda-forge |
| libwebp-base              | 1.2.1        | h7f98852_0          | conda-forge |
| libxml2                   | 2.9.12       | h885dcf4_1          | conda-forge |
| libzlib                   | 1.2.11       | h36c2ea0_1013       | conda-forge |
| lz4-c                     | 1.9.3        | h9c3ff4c_1          | conda-forge |
| lzstring                  | 1.0.4        | pypi_0              | pypi        |
| markdown                  | 3.3.6        | pypi_0              | pypi        |
| markupsafe                | 2.0.1        | pypi_0              | pypi        |
| matplotlib-base           | 3.5.0        | py38hf4fb855_0      | conda-forge |
| multiqc                   | 1.11         | pypi_0              | pypi        |
| munkres                   | 1.0.7        | py_1                | bioconda    |
| ncbi-ngs-sdk              | 2.11.2       | hff44eed_0          | bioconda    |
| ncurses                   | 6.2          | h58526e2_4          | conda-forge |
| networkx                  | 2.6.3        | pypi_0              | pypi        |
| numpy                     | 1.21.4       | py38he2449b9_0      | conda-forge |
| olefile                   | 0.46         | pyh9f0ad1d_1        | conda-forge |
| openjpeg                  | 2.4.0        | hb52868f_1          | conda-forge |
| openssl                   | 1.1.1o       | h166bdaf_0          | conda-forge |
| ossuuid                   | 1.6.2        | hf484d3e_1000       | conda-forge |
| packaging                 | 21.3         | pyhd8ed1ab_0        | conda-forge |
| perl                      | 5.26.2       | h36c2ea0_1008       | conda-forge |
| perl-app-cpanminus        | 1.7044       | pl526_1             | bioconda    |
| perl-business-isbn        | 3.004        | pl526_0             | bioconda    |
| perl-business-isbn-data   | 20140910     | pl526_0             | bioconda    |
| perl-carp                 | 1.38         | pl526_3             | bioconda    |
| perl-constant             | 1.33         | pl526_1             | bioconda    |
| perl-data-dumper          | 2.173        | pl526_0             | bioconda    |
| perl-encode               | 2.88         | pl526_1             | bioconda    |
| perl-exporter             | 5.72         | pl526_1             | bioconda    |
| perl-extutils-makemaker   | 7.36         | pl526_1             | bioconda    |
| perl-file-path            | 2.16         | pl526_0             | bioconda    |
| perl-file-temp            | 0.2304       | pl526_2             | bioconda    |
| perl-mime-base64          | 3.15         | pl526_1             | bioconda    |
| perl-parent               | 0.236        | pl526_1             | bioconda    |
| perl-uri                  | 1.76         | pl526_0             | bioconda    |
| perl-xml-libxml           | 2.0132       | pl526h7ec2d77_1     | bioconda    |
| perl-xml-namespacesupport | 1.12         | pl526_0             | bioconda    |
| perl-xml-sax              | 1.02         | pl526_0             | bioconda    |
| perl-xml-sax-base         | 1.09         | pl526_0             | bioconda    |
| perl-xsloader             | 0.24         | pl526_0             | bioconda    |
| pillow                    | 8.4.0        | py38h8e6f84c_0      | conda-forge |
| pip                       | 21.3.1       | pyhd8ed1ab_0        | conda-forge |
| plotly                    | 5.4.0        | pyhd8ed1ab_0        | conda-forge |
| py2bit                    | 0.3.0        | py38h4a8c8d9_5      | bioconda    |
| pybigwig                  | 0.3.18       | py38h5ebd311_1      | bioconda    |
| pygments                  | 2.10.0       | pypi_0              | pypi        |
| pyparsing                 | 3.0.6        | pyhd8ed1ab_0        | conda-forge |
| pysam                     | 0.17.0       | py38hf7546f9_0      | bioconda    |
| python                    | 3.8.0        | h0371630_2          |
| python-dateutil           | 2.8.2        | pyhd8ed1ab_0        | conda-forge |
| python_abi                | 3.8          | 2_cp38              | conda-forge |
| pyyaml                    | 6            | pypi_0              | pypi        |
| readline                  | 7            | hf8c457e_1001       | conda-forge |
| requests                  | 2.26.0       | pypi_0              | pypi        |
| rich                      | 10.16.0      | pypi_0              | pypi        |
| samtools                  | 1.14         | hb421002_0          | bioconda    |
| scipy                     | 1.7.3        | py38h56a6a73_0      | conda-forge |
| setuptools                | 59.2.0       | py38h578d9bd_0      | conda-forge |
| simplejson                | 3.17.6       | pypi_0              | pypi        |
| six                       | 1.16.0       | pyh6c4a22f_0        | conda-forge |
| spectra                   | 0.0.11       | pypi_0              | pypi        |
| sqlite                    | 3.33.0       | h62c20be_0          |
| sra-tools                 | 2.11.0       | pl5262h314213e_1    | bioconda    |
| star                      | 2.7.10a      | h9ee0642_0          | bioconda    |
| subread                   | 2.0.1        | h7132678_2          | bioconda    |
| tenacity                  | 8.0.1        | pyhd8ed1ab_0        | conda-forge |
| tk                        | 8.6.11       | h27826a3_1          | conda-forge |
| unicodedata2              | 13.0.0.post2 | py38h497a2fe_4      | conda-forge |
| urllib3                   | 1.26.7       | pypi_0              | pypi        |
| wheel                     | 0.37.0       | pyhd8ed1ab_1        | conda-forge |
| xz                        | 5.2.5        | h516909a_1          | conda-forge |
| zipp                      | 3.6.0        | pypi_0              | pypi        |
| zlib                      | 1.2.11       | h36c2ea0_1013       | conda-forge |
| zstd                      | 1.5.0        | ha95c52a_0          | conda-forge |

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
| Name                      | Version      | Build                   | Anaconda Channel |
| ------------------------- | ------------ | ----------------------- | ---------------- |
| _libgcc_mutex             | 0.1          | conda_forge             | conda-forge      |
| _openmp_mutex             | 4.5          | 2_gnu                   | conda-forge      |
| bbmap                     | 39.01        | h92535d8_1              | bioconda         |
| bedtools                  | 2.31.0       | hf5e1c6e_2              | bioconda         |
| blast                     | 2.14.0       | h7d5a4b4_1              | bioconda         |
| bowtie                    | 1.0.0        | 1                       | bioconda         |
| brotli                    | 1.0.9        | h166bdaf_8              | conda-forge      |
| brotli-bin                | 1.0.9        | h166bdaf_8              | conda-forge      |
| bwa                       | 0.7.17       | he4a0461_11             | bioconda         |
| bzip2                     | 1.0.8        | h7f98852_4              | conda-forge      |
| c-ares                    | 1.19.1       | hd590300_0              | conda-forge      |
| ca-certificates           | 2023.5.7     | hbcca054_0              | conda-forge      |
| cached-property           | 1.5.2        | hd8ed1ab_1              | conda-forge      |
| cached_property           | 1.5.2        | pyha770c72_1            | conda-forge      |
| certifi                   | 2023.5.7     | pyhd8ed1ab_0            | conda-forge      |
| charset-normalizer        | 3.1.0        | pyhd8ed1ab_0            | conda-forge      |
| click                     | 8.1.3        | unix_pyhd8ed1ab_2       | conda-forge      |
| coloredlogs               | 15.0.1       | pyhd8ed1ab_3            | conda-forge      |
| colormath                 | 3.0.0        | py_2                    | conda-forge      |
| contourpy                 | 1.0.7        | py310hdf3cbec_0         | conda-forge      |
| curl                      | 8.1.1        | h409715c_0              | conda-forge      |
| cycler                    | 0.11.0       | pyhd8ed1ab_0            | conda-forge      |
| dfam                      | 3.7          | hdfd78af_0              | bioconda         |
| entrez-direct             | 16.2         | he881be0_1              | bioconda         |
| expat                     | 2.5.0        | hcb278e6_1              | conda-forge      |
| fastp                     | 0.23.3       | h5f740d0_0              | bioconda         |
| fastqc                    | 0.12.1       | hdfd78af_0              | bioconda         |
| font-ttf-dejavu-sans-mono | 2.37         | hab24e00_0              | conda-forge      |
| fontconfig                | 2.14.2       | h14ed4e7_0              | conda-forge      |
| fonttools                 | 4.39.4       | py310h2372a71_0         | conda-forge      |
| freetype                  | 2.12.1       | hca18f0e_1              | conda-forge      |
| future                    | 0.18.3       | pyhd8ed1ab_0            | conda-forge      |
| gettext                   | 0.21.1       | h27087fc_0              | conda-forge      |
| gmap                      | 2023.04.28   | h67092d7_0              | bioconda         |
| h5py                      | 3.8.0        | nompi_py310ha66b2ad_101 | conda-forge      |
| hdf5                      | 1.14.0       | nompi_hb72d44e_103      | conda-forge      |
| hisat2                    | 2.2.1        | hdbdd923_6              | bioconda         |
| hmmer                     | 3.3.2        | hdbdd923_4              | bioconda         |
| htslib                    | 1.17         | h81da01d_2              | bioconda         |
| humanfriendly             | 10           | py310hff52083_4         | conda-forge      |
| icu                       | 70.1         | h27087fc_0              | conda-forge      |
| idna                      | 3.4          | pyhd8ed1ab_0            | conda-forge      |
| importlib-metadata        | 6.6.0        | pyha770c72_0            | conda-forge      |
| isa-l                     | 2.30.0       | ha770c72_4              | conda-forge      |
| jinja2                    | 3.1.2        | pyhd8ed1ab_1            | conda-forge      |
| keyutils                  | 1.6.1        | h166bdaf_0              | conda-forge      |
| kiwisolver                | 1.4.4        | py310hbf28c38_1         | conda-forge      |
| krb5                      | 1.20.1       | h81ceb04_0              | conda-forge      |
| lcms2                     | 2.15         | haa2dc70_1              | conda-forge      |
| ld_impl_linux-64          | 2.4          | h41732ed_0              | conda-forge      |
| lerc                      | 4.0.0        | h27087fc_0              | conda-forge      |
| libaec                    | 1.0.6        | hcb278e6_1              | conda-forge      |
| libblas                   | 3.9.0        | 16_linux64_openblas     | conda-forge      |
| libbrotlicommon           | 1.0.9        | h166bdaf_8              | conda-forge      |
| libbrotlidec              | 1.0.9        | h166bdaf_8              | conda-forge      |
| libbrotlienc              | 1.0.9        | h166bdaf_8              | conda-forge      |
| libcblas                  | 3.9.0        | 16_linux64_openblas     | conda-forge      |
| libcurl                   | 8.1.1        | h409715c_0              | conda-forge      |
| libdb                     | 6.2.32       | h9c3ff4c_0              | conda-forge      |
| libdeflate                | 1.18         | h0b41bf4_0              | conda-forge      |
| libedit                   | 3.1.20191231 | he28a2e2_2              | conda-forge      |
| libev                     | 4.33         | h516909a_1              | conda-forge      |
| libexpat                  | 2.5.0        | hcb278e6_1              | conda-forge      |
| libffi                    | 3.4.2        | h7f98852_5              | conda-forge      |
| libgcc-ng                 | 12.2.0       | h65d4601_19             | conda-forge      |
| libgfortran-ng            | 12.2.0       | h69a702a_19             | conda-forge      |
| libgfortran5              | 12.2.0       | h337968e_19             | conda-forge      |
| libgomp                   | 12.2.0       | h65d4601_19             | conda-forge      |
| libiconv                  | 1.17         | h166bdaf_0              | conda-forge      |
| libidn2                   | 2.3.4        | h166bdaf_0              | conda-forge      |
| libjpeg-turbo             | 2.1.5.1      | h0b41bf4_0              | conda-forge      |
| liblapack                 | 3.9.0        | 16_linux64_openblas     | conda-forge      |
| libnghttp2                | 1.52.0       | h61bc06f_0              | conda-forge      |
| libnsl                    | 2.0.0        | h7f98852_0              | conda-forge      |
| libopenblas               | 0.3.21       | pthreads_h78a6416_3     | conda-forge      |
| libpng                    | 1.6.39       | h753d276_0              | conda-forge      |
| libsqlite                 | 3.42.0       | h2797004_0              | conda-forge      |
| libssh2                   | 1.10.0       | hf14f497_3              | conda-forge      |
| libstdcxx-ng              | 12.2.0       | h46fd767_19             | conda-forge      |
| libtiff                   | 4.5.0        | ha587672_6              | conda-forge      |
| libunistring              | 0.9.10       | h7f98852_0              | conda-forge      |
| libuuid                   | 2.38.1       | h0b41bf4_0              | conda-forge      |
| libwebp-base              | 1.3.0        | h0b41bf4_0              | conda-forge      |
| libxcb                    | 1.15         | h0b41bf4_0              | conda-forge      |
| libxml2                   | 2.9.14       | h22db469_4              | conda-forge      |
| libzlib                   | 1.2.13       | h166bdaf_4              | conda-forge      |
| lzstring                  | 1.0.4        | py_1001                 | conda-forge      |
| markdown                  | 3.4.3        | pyhd8ed1ab_0            | conda-forge      |
| markdown-it-py            | 2.2.0        | pyhd8ed1ab_0            | conda-forge      |
| markupsafe                | 2.1.2        | py310h1fa729e_0         | conda-forge      |
| matplotlib-base           | 3.7.1        | py310he60537e_0         | conda-forge      |
| mdurl                     | 0.1.0        | pyhd8ed1ab_0            | conda-forge      |
| multiqc                   | 1.14         | pyhdfd78af_0            | bioconda         |
| munkres                   | 1.0.7        | py_1                    | bioconda         |
| ncbi-vdb                  | 3.0.5        | h87f3376_0              | bioconda         |
| ncurses                   | 6.3          | h27087fc_1              | conda-forge      |
| nettle                    | 3.8.1        | hc379101_1              | conda-forge      |
| networkx                  | 3.1          | pyhd8ed1ab_0            | conda-forge      |
| numpy                     | 1.24.3       | py310ha4c1d20_0         | conda-forge      |
| openjdk                   | 8.0.332      | h166bdaf_0              | conda-forge      |
| openjpeg                  | 2.5.0        | hfec8fc6_2              | conda-forge      |
| openssl                   | 3.1.1        | hd590300_1              | conda-forge      |
| ossuuid                   | 1.6.2        | hf484d3e_1000           | conda-forge      |
| packaging                 | 23.1         | pyhd8ed1ab_0            | conda-forge      |
| pbzip2                    | 1.1.13       | 0                       | conda-forge      |
| pcre                      | 8.45         | h9c3ff4c_0              | conda-forge      |
| perl                      | 5.32.1       | 2_h7f98852_perl5        | conda-forge      |
| perl-alien-build          | 2.48         | pl5321hec16e2b_0        | bioconda         |
| perl-alien-libxml2        | 0.17         | pl5321hec16e2b_0        | bioconda         |
| perl-archive-tar          | 2.4          | pl5321hdfd78af_0        | bioconda         |
| perl-business-isbn        | 3.007        | pl5321hdfd78af_0        | bioconda         |
| perl-business-isbn-data   | 20210112     | pl5321hdfd78af_0        | bioconda         |
| perl-capture-tiny         | 0.48         | pl5321hdfd78af_2        | bioconda         |
| perl-carp                 | 1.38         | pl5321hdfd78af_4        | bioconda         |
| perl-common-sense         | 3.75         | pl5321hdfd78af_0        | bioconda         |
| perl-compress-raw-bzip2   | 2.201        | pl5321h87f3376_1        | bioconda         |
| perl-compress-raw-zlib    | 2.105        | pl5321h87f3376_0        | bioconda         |
| perl-constant             | 1.33         | pl5321hdfd78af_2        | bioconda         |
| perl-data-dumper          | 2.183        | pl5321hec16e2b_1        | bioconda         |
| perl-db-file              | 1.855        | pl5321h779adbc_1        | bioconda         |
| perl-encode               | 3.19         | pl5321hec16e2b_1        | bioconda         |
| perl-exporter             | 5.72         | pl5321hdfd78af_2        | bioconda         |
| perl-exporter-tiny        | 1.002002     | pl5321hdfd78af_0        | bioconda         |
| perl-extutils-makemaker   | 7.7          | pl5321hd8ed1ab_0        | conda-forge      |
| perl-ffi-checklib         | 0.28         | pl5321hdfd78af_0        | bioconda         |
| perl-file-chdir           | 0.101        | pl5321hdfd78af_3        | bioconda         |
| perl-file-path            | 2.18         | pl5321hd8ed1ab_0        | conda-forge      |
| perl-file-temp            | 0.2304       | pl5321hd8ed1ab_0        | conda-forge      |
| perl-file-util            | 4.20172      | pl5321hdfd78af_0        | bioconda         |
| perl-file-which           | 1.24         | pl5321hd8ed1ab_0        | conda-forge      |
| perl-importer             | 0.026        | pl5321hdfd78af_0        | bioconda         |
| perl-io-compress          | 2.201        | pl5321hdbdd923_2        | bioconda         |
| perl-io-gzip              | 0.2          | pl5321h7132678_4        | bioconda         |
| perl-io-zlib              | 1.14         | pl5321hdfd78af_0        | bioconda         |
| perl-json                 | 4.1          | pl5321hdfd78af_0        | bioconda         |
| perl-json-xs              | 2.34         | pl5321h4ac6f70_6        | bioconda         |
| perl-lib                  | 0.63         | pl5321hdfd78af_2        | bioconda         |
| perl-list-moreutils       | 0.43         | pl5321hdfd78af_0        | bioconda         |
| perl-list-moreutils-xs    | 0.43         | pl5321h031d066_2        | bioconda         |
| perl-mime-base64          | 3.16         | pl5321hec16e2b_2        | bioconda         |
| perl-parent               | 0.236        | pl5321hdfd78af_2        | bioconda         |
| perl-path-tiny            | 0.122        | pl5321hdfd78af_0        | bioconda         |
| perl-pathtools            | 3.75         | pl5321hec16e2b_3        | bioconda         |
| perl-scalar-list-utils    | 1.62         | pl5321hec16e2b_1        | bioconda         |
| perl-scope-guard          | 0.21         | pl5321hdfd78af_3        | bioconda         |
| perl-set-intervaltree     | 0.12         | pl5321hdbdd923_3        | bioconda         |
| perl-sub-info             | 0.002        | pl5321hdfd78af_1        | bioconda         |
| perl-term-table           | 0.016        | pl5321hdfd78af_0        | bioconda         |
| perl-test2-suite          | 0.000145     | pl5321hdfd78af_0        | bioconda         |
| perl-types-serialiser     | 1.01         | pl5321hdfd78af_0        | bioconda         |
| perl-uri                  | 5.12         | pl5321hdfd78af_0        | bioconda         |
| perl-xml-libxml           | 2.0207       | pl5321h661654b_0        | bioconda         |
| perl-xml-namespacesupport | 1.12         | pl5321hdfd78af_1        | bioconda         |
| perl-xml-sax              | 1.02         | pl5321hdfd78af_1        | bioconda         |
| perl-xml-sax-base         | 1.09         | pl5321hdfd78af_1        | bioconda         |
| pillow                    | 9.5.0        | py310h582fbeb_1         | conda-forge      |
| pip                       | 23.1.2       | pyhd8ed1ab_0            | conda-forge      |
| pthread-stubs             | 0.4          | h36c2ea0_1001           | conda-forge      |
| pygments                  | 2.15.1       | pyhd8ed1ab_0            | conda-forge      |
| pyparsing                 | 3.0.9        | pyhd8ed1ab_0            | conda-forge      |
| pysocks                   | 1.7.1        | pyha2e5f31_6            | conda-forge      |
| python                    | 3.10.0       | h543edf9_3_cpython      | conda-forge      |
| python-dateutil           | 2.8.2        | pyhd8ed1ab_0            | conda-forge      |
| python-wget               | 3.2          | py_0                    | conda-forge      |
| python_abi                | 3.1          | 3_cp310                 | conda-forge      |
| pyyaml                    | 6            | py310h5764c6d_5         | conda-forge      |
| readline                  | 8.2          | h8228510_1              | conda-forge      |
| repeatmasker              | 4.1.5        | pl5321hdfd78af_0        | bioconda         |
| requests                  | 2.31.0       | pyhd8ed1ab_0            | conda-forge      |
| rich                      | 13.4.1       | pyhd8ed1ab_0            | conda-forge      |
| rich-click                | 1.6.1        | pyhd8ed1ab_0            | conda-forge      |
| rmblast                   | 2.14.0       | h21a3994_1              | bioconda         |
| samtools                  | 1.17         | hd87286a_1              | bioconda         |
| setuptools                | 67.7.2       | pyhd8ed1ab_0            | conda-forge      |
| simplejson                | 3.19.1       | py310h1fa729e_0         | conda-forge      |
| singularity               | 3.6.4        |                         | N/A              |
| six                       | 1.16.0       | pyh6c4a22f_0            | conda-forge      |
| spectra                   | 0.0.11       | py_1                    | conda-forge      |
| sqlite                    | 3.42.0       | h2c6b66d_0              | conda-forge      |
| sra-tools                 | 3.0.5        | h87f3376_0              | bioconda         |
| star                      | 2.7.10b      | h6b7c446_1              | bioconda         |
| star-fusion               | 1.12.0       | 0                       | N/A              |
| subread                   | 2.0.3        | he4a0461_3              | bioconda         |
| tk                        | 8.6.12       | h27826a3_0              | conda-forge      |
| trf                       | 4.09.1       | h031d066_4              | bioconda         |
| typing_extensions         | 4.6.3        | pyha770c72_0            | conda-forge      |
| tzdata                    | 2023c        | h71feb2d_0              | conda-forge      |
| unicodedata2              | 15.0.0       | py310h5764c6d_0         | conda-forge      |
| urllib3                   | 2.0.2        | pyhd8ed1ab_0            | conda-forge      |
| wget                      | 1.20.3       | ha35d2d1_1              | conda-forge      |
| wheel                     | 0.40.0       | pyhd8ed1ab_0            | conda-forge      |
| xorg-libxau               | 1.0.11       | hd590300_0              | conda-forge      |
| xorg-libxdmcp             | 1.1.3        | h7f98852_0              | conda-forge      |
| xz                        | 5.2.6        | h166bdaf_0              | conda-forge      |
| yaml                      | 0.2.5        | h7f98852_2              | conda-forge      |
| zipp                      | 3.15.0       | pyhd8ed1ab_0            | conda-forge      |
| zlib                      | 1.2.13       | h166bdaf_4              | conda-forge      |
| zstd                      | 1.5.2        | h3eb15da_6              | conda-forge      |

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
