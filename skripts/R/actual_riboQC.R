

# Installation of the package (to be done only once!)
#install.packages("devtools")

library("devtools")
#install.packages("C://Users//Thomas//Downloads//RiboseQC//RiboseQC_0.99.0.tar.gz", repos = NULL, type="source")

#install_github(repo = "ohlerlab/RiboseQC")

###### Analysis part ######

# Load the package
library(RiboseQC)

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = "C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//",
                         twobit_file = "C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//GRCh38.dna.primary_assembly.2bit",
                         gtf_file = "C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//Homo_sapiens.GRCh38.110.gtf",
                         scientific_name = "Homo.sapiens",
                         annotation_name = "GRCh38",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//RPF_WT_Rep1_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//RPF_WT_Rep2_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//RPF_KO_Rep1_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//RPF_KO_Rep2_clpd_tr.fastq.gz_no_r_t_sno_sn_RNA_GRCh38_sorted.bam"
)

load_annotation("C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana//Homo_sapiens.GRCh38.110.gtf_Rannot")

###### QC plots ######

RiboseQC_analysis(annotation_file ="C://Users//Thomas//Desktop//uni//Bioinf//sem1//RNA_seq//R_ana///Homo_sapiens.GRCh38.110.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "C:\\Users\\Thomas\\Desktop\\uni\\Bioinf\\sem1\\RNA_seq\\R_ana\\QC_reports",
                  sample_names = c("WT_Rep1", "WT_Rep2",
                                   "KO_Rep1", "KO_Rep2"),
                  dest_names = c("WT_Rep1", "WT_Rep2",
                                 "KO_Rep1", "KO_Rep2"),
                  write_tmp_files = F)
