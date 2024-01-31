FROM ubuntu:20.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        apt-transport-https
RUN apt-get update -y && apt-get install -y \
    build-essential \
    ca-certificates \
    zlib1g-dev
# install sra

RUN wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.0.7/sratoolkit.3.0.7-ubuntu64.tar.gz
RUN tar -vxzf sratoolkit.tar.gz
ENV PATH="/sratoolkit.3.0.7-ubuntu64/bin:${PATH}"

# install java
RUN apt install default-jre -y

#install fastqc
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip
RUN apt-get install unzip
RUN unzip fastqc_v0.12.1.zip
RUN chmod 755 ./FastQC/fastqc
RUN apt-get install cpanminus -y
RUN apt-get update && apt-get install -y cpanminus make
RUN cpanm FindBin
ENV PATH="/FastQC/:${PATH}"


# install bowtie
RUN apt-get update && apt-get install -y build-essential g++ wget libtbb-dev zlib1g-dev
WORKDIR /opt/
RUN wget https://github.com/BenLangmead/bowtie/archive/v1.2.3.tar.gz
RUN tar -xzvf v1.2.3.tar.gz
WORKDIR /opt/bowtie-1.2.3
RUN make
RUN cp bowtie* /usr/local/bin
WORKDIR /
RUN apt-get install python3.8 -y python3-pip
RUN ln -s /usr/bin/python3.8 /usr/bin/python

#install cutadapt
RUN apt install cutadapt -y

# install  samtools
#install some dependency
RUN apt-get update && apt-get install -y libncurses5-dev
RUN apt-get update && apt-get install -y liblzma-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y libcurl4-openssl-dev

RUN wget https://github.com/samtools/samtools/releases/download/1.18/samtools-1.18.tar.bz2
RUN tar -xjvf samtools-1.18.tar.bz2
WORKDIR /samtools-1.18
RUN make
RUN make install
#ENV PATH=/where/to/install/bin:$PATH    # for sh or bash users --> seems to be not needed

WORKDIR /
RUN wget https://netcologne.dl.sourceforge.net/project/subread/subread-2.0.6/subread-2.0.6-Linux-x86_64.tar.gz
Run tar -zxvf subread-2.0.6-Linux-x86_64.tar.gz
Run cd subread-2.0.6-Linux-x86_64/bin 
ENV PATH="/subread-2.0.6-Linux-x86_64/bin:${PATH}"

RUN pip install multiqc

#ENTRYPOINT ["2_run_fastqc.sh"]
