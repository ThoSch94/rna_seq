#!/usr/bin/env bash

export APPTAINER_TMPDIR="$SCRATCH" 


# unwanted RNA
bowtie-build /data/users/tschiller/RNA_seq/Raw_data/annotation/unwanted_RNA_annotations/annotation_unwanted_RNA.fa /data/users/tschiller/RNA_seq/processed_data/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb
# Genome
bowtie-build /data/users/tschiller/RNA_seq/Raw_data/annotation/DNA_annotation/GRCh38.dna.primary_assembly.fa /data/users/tschiller/RNA_seq/processed_data/GRCh38.dna.primary_assembly
# transcriptome
bowtie-build /data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/GRCh38_APPRIS_CDS_18.fa /data/users/tschiller/RNA_seq/processed_data/GRCh38_APPRIS_CDS_18

# Process transcriptome FASTA
awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' < /data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/GRCh38_APPRIS_CDS_18.fa > /data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa
