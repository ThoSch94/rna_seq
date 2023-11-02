#!/usr/bin/env bash
cd /data/users/tschiller/RNA_seq/exercise_data/actual_data
fastqc -o ../fastqc -f fastq *.fastq.gz