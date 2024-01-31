cd /data/users/tschiller/RNA_seq/processed_data
touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
/data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/tschiller/RNA_seq/processed_data/RPF_KO_Rep1.fastq.gz_clpd.fastq.gz_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep1_Codon_occupancy.txt


touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
/data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/tschiller/RNA_seq/processed_data/RPF_KO_Rep2.fastq.gz_clpd.fastq.gz_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep2_Codon_occupancy.txt


touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
/data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/tschiller/RNA_seq/processed_data/RPF_WT_Rep1.fastq.gz_clpd.fastq.gz_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep1_Codon_occupancy.txt


touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
/data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa \
/data/users/tschiller/RNA_seq/processed_data/RPF_WT_Rep2.fastq.gz_clpd.fastq.gz_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep2_Codon_occupancy.txt



Rscript /data/users/tschiller/RNA_seq/rna_seq/skripts/R/codon_occ.r


