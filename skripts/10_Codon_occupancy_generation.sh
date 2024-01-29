cd /data/users/tschiller/RNA_seq/processed_data
touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
./GRCh38_APPRIS_CDS_18_SingleLine.fa \
./RPF_KO_Rep1_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep1_Codon_occupancy.txt


touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
./GRCh38_APPRIS_CDS_18_SingleLine.fa \
./RPF_KO_Rep2_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep2_Codon_occupancy.txt


touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
./GRCh38_APPRIS_CDS_18_SingleLine.fa \
./RPF_WT_Rep1_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep1_Codon_occupancy.txt


touch ./Codon_occupancy.txt
/data/users/tschiller/RNA_seq/rna_seq/skripts/Codon_occupancy_cal.sh \
./GRCh38_APPRIS_CDS_18_SingleLine.fa \
./RPF_WT_Rep2_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep2_Codon_occupancy.txt



Rscript /data/users/tschiller/RNA_seq/rna_seq/skripts/R/codon_occ.r


multiqc .