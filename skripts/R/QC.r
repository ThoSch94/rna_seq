#install.packages("/data/users/tschiller/RNA_seq/ribo_Qc_R/RiboseQC_0.99.0.tar.gz", repos = NULL, type="source")


# Installation of the package (to be done only once!)
#install.packages("devtools")

library("devtools")

#install_github(repo = "ohlerlab/RiboseQC")

###### Analysis part ######

# Load the package
library(RiboseQC)

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = "/path/of/Human/Genome/",
                         twobit_file = "/data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/GRCh38.dna.primary_assembly.2bit",
                         gtf_file = "/data/users/tschiller/RNA_seq/Raw_data/annotation/DNA_annotation/Homo_sapiens.GRCh38.110.gtf",
                         scientific_name = "Homo.sapiens",
                         annotation_name = "GRCh38",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("/data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/RPF_WT_Rep2_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam"
                "/data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/RPF_WT_Rep1_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam"
                "/data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/RPF_KO_Rep1_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "/data/users/tschiller/RNA_seq/processed_data/mapping_unwanted_rna/RPF_KO_Rep2_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
)

load_annotation("/path/of/Homo_sapiens.GRCh38.108.gtf_Rannot")

###### QC plots ######

RiboseQC_analysis(annotation_file ="/path/of/Homo_sapiens.GRCh38.108.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "/data/users/tschiller/RNA_seq/rna_seq/skripts/R/QC_reports",
                  sample_names = c("WT_Rep1", "WT_Rep2",
                                   "KO_Rep1", "KO_Rep2"),
                  dest_names = c("WT_Rep1", "WT_Rep2",
                                 "KO_Rep1", "KO_Rep2"),
                  write_tmp_files = F)