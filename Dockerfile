FROM ubuntu:18.04

MAINTAINER Ataev Arslan <greatjaaack@gmail.com>

RUN mkdir /usr/SOFT/

WORKDIR /usr/SOFT/

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install libtool wget autoconf automake git make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev && \
	apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Samtools & libdeflate
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
    git clone https://github.com/ebiggers/libdeflate.git && \
	tar jxf samtools-1.12.tar.bz2 && \
	rm samtools-1.12.tar.bz2 && \
	cd libdeflate && \
	make && \
	make install && \
	cd .. && \
	cd samtools-1.12 && \
	./configure --enable-plugins --prefix $(pwd) && \
	./configure --enable-plugins --with-plugin-path=$(~/usr/SOFT/libdeflate) && \
	make all all-htslib && \
	make install install-htslib

# RUN wget https://www.zlib.net/zlib-1.2.11.tar.gz && \
#     tar -xvzf zlib-1.2.11.tar.gz && \
#     rm zlib-1.2.11.tar.gz && \
#     cd zlib-1.2.11 && \
#     ./configure --prefix=/usr/include/zlib && \
#     make && \
#     make install

# RUN wget https://gitlab.com/german.tischler/biobambam2/-/archive/2.0.181-release-20210402160658/biobambam2-2.0.181-release-20210402160658.tar.gz && \
#     wget https://gitlab.com/german.tischler/libmaus2/-/archive/2.0.774-release-20210315224229/libmaus2-2.0.774-release-20210315224229.tar.gz && \
#
#     tar xf biobambam2-2.0.181-release-20210402160658.tar.gz && \
# 	rm biobambam2-2.0.181-release-20210402160658.tar.gz && \
#
# 	tar xf libmaus2-2.0.774-release-20210315224229.tar.gz && \
# 	rm libmaus2-2.0.774-release-20210315224229.tar.gz && \
#
# 	cd libmaus2-2.0.774-release-20210315224229