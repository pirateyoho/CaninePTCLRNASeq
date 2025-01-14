#!/bin/bash

# Install lollipops package:
wget https://github.com/joiningdata/lollipops/releases/download/v1.7.2/lollipops_1.7.2_linux_amd64.tar.gz
tar -xzf lollipops_1.7.2_linux_amd64.tar.gz

#### Draw plots ####
## Format: lollipops [options] {-U UNIPROT_ID | GENE_SYMBOL} [PROTEIN CHANGES ...], where protein changes are specified in a <AMINO><CODON><AMINO><#COLOR><@COUNT> format
# Plots saved as SVG files by default

# DNMT3A
./lollipops -legend -labels -w=700 -U A0A8C0MAP0 V48A E198K@2 A439T V669A V744M W780R@3 C846Y
./lollipops -legend -labels -w=700 -U A0A8I3SA17  V48A E198K@2 A439T V669A V744M W780R@3 C846Y
./lollipops -legend -labels -w=700 -U A0A8C0QMZ5 V48A E198K@2 A439T V669A V744M W780R@3 C846Y

# TP53
./lollipops -legend -labels -w=700 -U Q29537 A210P A212T A255D A9Gfs*66 A9Pfs*26@2 D333E E10Sfs*25 E310A E338Rfs*38 G345E G354Rfs*35 K171Q N182del N299I P330H P330L Q370Afs*19 R209H R225W@3 R226H R300Q R325C S414R T169S Y154Tfs*67 Y177Dfs*7@2 Y177Pfs*66 Y214*
./lollipops -legend -labels -w=700 -U A0A8C0RLV2 A210P A212T A255D A9Gfs*66 A9Pfs*26@2 D333E E10Sfs*25 E310A E338Rfs*38 G345E G354Rfs*35 K171Q N182del N299I P330H P330L Q370Afs*19 R209H R225W@3 R226H R300Q R325C S414R T169S Y154Tfs*67 Y177Dfs*7@2 Y177Pfs*66 Y214*
./lollipops -legend -labels -w=700 -U E7FIY6 A210P A212T A255D A9Gfs*66 A9Pfs*26@2 D333E E10Sfs*25 E310A E338Rfs*38 G345E G354Rfs*35 K171Q N182del N299I P330H P330L Q370Afs*19 R209H R225W@3 R226H R300Q R325C S414R T169S Y154Tfs*67 Y177Dfs*7@2 Y177Pfs*66 Y214*
./lollipops -legend -labels -w=700 -U A0A8C0NMX3 A210P A212T A255D A9Gfs*66 A9Pfs*26@2 D333E E10Sfs*25 E310A E338Rfs*38 G345E G354Rfs*35 K171Q N182del N299I P330H P330L Q370Afs*19 R209H R225W@3 R226H R300Q R325C S414R T169S Y154Tfs*67 Y177Dfs*7@2 Y177Pfs*66 Y214*
./lollipops -legend -labels -w=700 -U A0A8I3PMM3 A210P A212T A255D A9Gfs*66 A9Pfs*26@2 D333E E10Sfs*25 E310A E338Rfs*38 G345E G354Rfs*35 K171Q N182del N299I P330H P330L Q370Afs*19 R209H R225W@3 R226H R300Q R325C S414R T169S Y154Tfs*67 Y177Dfs*7@2 Y177Pfs*66 Y214*