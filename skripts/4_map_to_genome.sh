cd /data/users/tschiller/RNA_seq/processed_data
cp /data/users/tschiller/RNA_seq/Raw_data/annotation/DNA_annotation/GRCh38.dna.primary_assembly.fa .
# module load Bowtie/1.3.1-GCC-10.3.0 
# module load SAMtools/1.13-GCC-10.3.0
for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie \
-S GRCh38.dna.primary_assembly \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
-q ${x} \
2> $(basename ${x} .fastq)_GRCh38_log.txt | \
samtools view \
-h \
-F 4 \
-b > $(basename ${x} .fastq)_GRCh38.bam; done

# Sort the BAM file

for x in $(ls -d *.bam); \
do echo ${x}; \
samtools sort \
-@ 4 \
${x} \
-o $(basename ${x} .bam)_sorted.bam; done

# Remove the unsorted BAM file
rm *GRCh38.bam

awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' < /data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/GRCh38_APPRIS_CDS_18.fa >/data/users/tschiller/RNA_seq/Raw_data/annotation/transcriptome_annotation/processed/GRCh38_APPRIS_CDS_18_SingleLine.fa