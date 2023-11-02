# unwanted RNA

bowtie-build /data/users/tschiller/RNA_seq/exercise_data/unwanted_RNA_annotations/annotation_unwanted_RNA.fa annotation_unwanted_RNA

# genome

bowtie-build /data/users/tschiller/RNA_seq/exercise_data/DNA_annotation/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz GRCh38.dna.primary_assembly

# transcriptome

bowtie-build /data/users/tschiller/RNA_seq/exercise_data/transcriptome_annotation/mart_export1.txt transcriptome