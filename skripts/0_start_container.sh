#!/usr/bin/env bash

# srun -p pibu_el8 --cpus-per-task=8  --mem-per-cpu=2000M --time=04:05:00 --pty bash



# pull docker image from docker hub
cd /data/users/tschiller/RNA_seq
mkdir container_image
cd container_image
FILE=rna-seq_latest.sif
if [ -f "$FILE" ]; then
    rm $FILE
fi

apptainer pull docker://thoschiller/rna-seq
# cd /data/users/tschiller/RNA_seq/container_image
apptainer run /data/users/tschiller/RNA_seq/container_image/rna-seq_latest.sif 