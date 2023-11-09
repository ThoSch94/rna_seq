#!/usr/bin/env bash

#srun --cpus-per-task=1  --mem-per-cpu=500M --time=01:05:00 --pty bash



# pull docker image from docker hub
cd /data/users/tschiller/RNA_seq
mkdir container_image
cd container_image
FILE=rna-seq_latest.sif
if [ -f "$FILE" ]; then
    rm $FILE
fi
apptainer pull docker://thoschiller/rna-seq

apptainer run rna-seq_latest.sif 

export APPTAINER_TMPDIR="$SCRATCH" 


