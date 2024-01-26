cd /data/users/tschiller/RNA_seq/processed_data/actual_data
# move the bowtie index files to this dirctory as I had problems working with paths
mv ../Bowtie/GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb* .
 
# now the actual work
for file in $(ls -d *tr.fastq.gz); do
#echo $file \
gunzip -cd $file | \
bowtie -p 4 -x GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb -S  GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb -t  - --un ${file}_no_r_t_sno_sn_RNA.fastq 2> ${file}_no_r_t_sno_sn_RNA_log.txt > /dev/null;
done

# now lets move the output files to new directories
mkdir ../mapping_unwanted_rna
mkdir ../mapping_unwanted_rna/logs
mv *_no_r_t_sno_sn_RNA.* ../mapping_unwanted_rna
mv *RNA_log.* ../mapping_unwanted_rna/logs
# and the bowtie files too
mv GRCh38_p13_r_t_sno_sn_RNA_ENSEMBL_NCBI_GtRNAdb* ../Bowtie
