#!/usr/bin/env bash
#
#cd ~
#/bin/bash
#perl -MNet::FTP -e \
#    '$ftp = new Net::FTP("ftp.ncbi.nlm.nih.gov", Passive => 1);
#    $ftp->login; $ftp->binary;
#    $ftp->get("/entrez/entrezdirect/edirect.tar.gz");'
#gunzip -c edirect.tar.gz | tar xf -
#rm edirect.tar.gz
#builtin exit
#export PATH=$PATH:$HOME/edirect >& /dev/null || setenv PATH "${PATH}:$HOME/edirect"

# unwanted RNA
bowtie-build /data/users/tschiller/RNA_seq/Raw_data/unwanted_RNA_annotations/annotation_unwanted_RNA.fa /data/users/tschiller/RNA_seq/processed_data/Bowtie/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb
# Genome
bowtie-build /data/users/tschiller/RNA_seq/Raw_data/DNA_annotation/GRCh38.dna.primary_assembly.fa /data/users/tschiller/RNA_seq/processed_data/Bowtie/GRCh38.dna.primary_assembly
# transcriptome
bowtie-build /data/users/tschiller/RNA_seq/Raw_data/transcriptome_annotation/mart_export1.txt /data/users/tschiller/RNA_seq/processed_data/Bowtie/GRCh38_APPRIS_CDS_18

# Process transcriptome FASTA
awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' < /data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/mart_export1.txt > /data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa