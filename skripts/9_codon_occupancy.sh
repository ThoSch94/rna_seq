cd /data/users/tschiller/RNA_seq/processed_data

for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
--norc \
GRCh38_APPRIS_CDS_18 \
-q ${x} \
-S $(basename ${x} .fastq)_GRCh38_APPRIS_CDS.sam 2> $(basename ${x} .fastq)_GRCh38_APPRIS_CDS_log.txt; done

# -t        print time
# -v        max 1 mismatch
# -m        only report unique allignments
# --best    “best” in terms of stratum (i.e. number of mismatches, or mismatches in the seed in the case of -n mode) and in terms of the quality values at the mismatched position(s)
# --strata  bowtie will not attempt to align against the reverse-complement reference strand
# --norc    report only those alignments that fall into the best stratum.
# -q        input fastq
