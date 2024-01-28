cd /data/users/tschiller/RNA_seq/processed_data/featureCounts

featureCounts \
-T 8 \
-t CDS \
-g gene_id \
-a /data/users/tschiller/RNA_seq/Raw_data/annotation/DNA_annotation/Homo_sapiens.GRCh38.110.gtf \
-o CDS_counts_rawfile.txt /data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/*_GRCh38_sorted.bam

# Extract GeneID and Sample columns

cut -f 1,7-10 CDS_counts_rawfile.txt > CDS_counts_processed.txt


featureCounts \
-T 8 \
-t exon \
-g gene_biotype \
-a /data/users/tschiller/RNA_seq/Raw_data/annotation/DNA_annotation/Homo_sapiens.GRCh38.110.gtf \
-o biotype_counts_rawfile.txt /data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/*_GRCh38_sorted.bam

# Extract Biotype and Sample columns

cut -f 1,7-10 biotype_counts_rawfile.txt > biotype_counts_processed.txt

