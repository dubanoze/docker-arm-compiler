FROM ubuntu:14.04

RUN apt-get update && apt-get -y install lib32stdc++6 expect build-essential unzip
ADD ./Installer /tmp
ADD ./install.sh /tmp
ADD mdk_elmaps.zip /tmp
ENV PATH $PATH:/usr/local/ARM_Compiler_5.06u6/bin64
RUN sh /tmp/install.sh
RUN unzip /tmp/mdk_elmaps.zip && mv *.elmap /usr/local/ARM_Compiler_5.06u6/sw/mappings
