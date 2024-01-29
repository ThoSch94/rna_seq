cd /data/users/tschiller/RNA_seq/
mkdir faToTwoBit
cd /data/users/tschiller/RNA_seq/faToTwoBit
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit
chmod +x faToTwoBit
./faToTwoBit /data/users/tschiller/RNA_seq/Raw_data/annotation/DNA_annotation/GRCh38.dna.primary_assembly.fa /data/users/tschiller/RNA_seq/processed_data/GRCh38.dna.primary_assembly.2bit
exit

cd /data/users/tschiller/RNA_seq/processed_data
module load R-bundle-IBU/2023072800-foss-2021a-R-4.2.1
Rscript /data/users/tschiller/RNA_seq/rna_seq/skripts/R/QC.r