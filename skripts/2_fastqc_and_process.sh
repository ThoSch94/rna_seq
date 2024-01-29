
cd /data/users/tschiller/RNA_seq/processed_data/
mkdir fastqc
# Do fastqc
fastqc -o ./fastqc -f fastq /data/users/tschiller/RNA_seq/Raw_data/original_data/*.fastq.gz
# rename and move all reports
cd /data/users/tschiller/RNA_seq/processed_data/fastqc
mkdir original_data
for file in *_fastqc.*; do
    new_filename="original_data_$file"
    mv $file ./original_data/$new_filename
done

# clean data

cd /data/users/tschiller/RNA_seq/Raw_data/original_data
for x in $(ls -d *.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-a CTGTAGGCACCATCAAT \
-q 25 \
--minimum-length 25 \
--discard-untrimmed \
-o /data/users/tschiller/RNA_seq/processed_data/$(basename ${x})_clpd.fastq.gz \
${x} 1> /data/users/tschiller/RNA_seq/processed_data/$(basename ${x})_clpd_log.txt; done

cd /data/users/tschiller/RNA_seq/processed_data/
# Trim 4 nt (randomized bases) from the 3' end
for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-q 25 \
--cut -4 \
--minimum-length 25 \
-o /data/users/tschiller/RNA_seq/processed_data/$(basename ${x})_tr.fastq.gz \
${x} 1> /data/users/tschiller/RNA_seq/processed_data/$(basename ${x})_tr_log.txt; done

# fast qc again
cd /data/users/tschiller/RNA_seq/processed_data/
fastqc -o ./fastqc -f fastq *_tr.fastq.gz