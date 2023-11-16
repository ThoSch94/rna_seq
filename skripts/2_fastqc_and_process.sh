#!/usr/bin/env bash
#cd /data/users/tschiller/RNA_seq/exercise_data/actual_data
#fastqc -o ../fastqc -f fastq *.fastq.gz
#
#cd /data/users/tschiller/RNA_seq/exercise_data/fastqc
#mkdir original_data
#for file in *_fastqc.*; do
#    new_filename="original_data_$file"
#    mv $file ./original_data/$new_filename
#done
#
#cd /data/users/tschiller/RNA_seq/exercise_data/actual_data
#mkdir original_data
#cp *.fastq.gz original_data
cd /data/users/tschiller/RNA_seq/exercise_data/actual_data
for x in $(ls -d *.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-a CTGTAGGCACCATCAAT \
-q 25 \
--minimum-length 25 \
--discard-untrimmed \
-o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt; done


# Trim 4 nt (randomized bases) from the 3' end
for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-q 25 \
--cut -4 \
--minimum-length 25 \
-o $(basename ${x} .fastq.gz)_tr.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt; done

fastqc -o ../fastqc -f fastq *_tr.fastq.gz