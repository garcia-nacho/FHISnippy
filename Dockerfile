FROM staphb/snippy
LABEL maintainer="Nacho Garcia <iggl@fhi.no>"

RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

ARG USER=docker
ARG GROUP=docker
ARG UID
ARG GID

ENV USER=$USER
ENV GROUP=$GROUP
ENV UID=$UID
ENV GID=$GID
ENV HOME="/home/${USER}"

USER root

RUN apt-get update && apt-get install -y --no-install-recommends iqtree gubbins

RUN cd /home/docker/ && wget http://www.microbesonline.org/fasttree/FastTree && mv FastTree /usr/bin/FastTree && chmod +x /usr/bin/FastTree

USER docker

RUN mkdir /home/docker/code
RUN mkdir /home/docker/references
COPY snippy.runnerGAS.sh /home/docker/code
COPY SASM4_Duke.fasta /home/docker/references
WORKDIR /Data