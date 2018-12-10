FROM 	ubuntu:18.04
RUN  	apt-get update \
	&& apt-get install -y wget vim\
  	&& rm -rf /var/lib/apt/lists/* 
WORKDIR	/tmp
RUN	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
	&& bash ~/miniconda.sh -b -p /opt/miniconda \
	&& echo 'export PATH="/opt/miniconda/bin:$PATH"' >>/root/.bashrc
WORKDIR	/
CMD	/bin/bash
