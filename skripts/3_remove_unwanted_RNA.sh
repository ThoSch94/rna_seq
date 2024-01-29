cd /data/users/tschiller/RNA_seq/processed_data/
 
# now the actual work
for file in $(ls -d *tr.fastq.gz); do
#echo $file \
gunzip -cd $file | \
bowtie -p 4 -x GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb -S  GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb -t  - --un ${file}_no_r_t_sno_sn_RNA.fastq 2> ${file}_no_r_t_sno_sn_RNA_log.txt > /dev/null;
done


