# download RNA annotation from ncbi
cd /data/users/tschiller/RNA_seq/exercise_data
mkdir unwanted_RNA_annotations
cd unwanted_RNA_annotations
module load Blast/edirect/2020.08.17;
FILE=GRCh38_rRNA_NCBI.txt
if [ -f "$FILE" ]; then
    rm $FILE
fi
esearch -db nuccore -query "biomol_rRNA[prop] AND \"Homo sapiens\"[Organism]" | efetch -format fasta > GRCh38_rRNA_NCBI.txt
module unload Blast/edirect/2020.08.17;

# download from that tRNA db
wget http://gtrnadb.ucsc.edu/genomes/eukaryota/Hsapi38/hg38-tRNAs.fa
mv hg38-tRNAs.fa hg38-tRNAs.txt

# the other file were transfered from my laptop via ssh

# assemble all annotation files into one
cat *.txt > annotation_unwanted_RNA.fa

cd ..

# downlaoding DNA annotations

mkdir DNA_annotations
cd DNA_annotations
wget https://ftp.ensembl.org/pub/release-110/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
wget https://ftp.ensembl.org/pub/release-110/gtf/homo_sapiens/Homo_sapiens.GRCh38.110.gtf.gz
cd ..


