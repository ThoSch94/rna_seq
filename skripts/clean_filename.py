import re
import os


directory = r"/data/users/tschiller/RNA_seq/processed_data"
directory = r"/data/users/tschiller/RNA_seq/processed_data/fastqc"
os.chdir(directory)
for filename in os.listdir(directory):
    if os.path.isfile(os.path.join(directory, filename)):
        new_name = re.sub("\.fastq\.gz(?!$)", "", filename)
        new_name = new_name
        os.rename(filename, new_name)
