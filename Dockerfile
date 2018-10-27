FROM ubuntu:14.04

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install lib32stdc++6 expect build-essential unzip
RUN apt-get install wine1.6 -y
ADD ./Installer /tmp
ADD ./install.sh /tmp
ADD ./entrypoint.sh /
ADD mdk_elmaps.zip /tmp
ADD Keil_v5.zip /tmp

ENV PATH $PATH:/usr/local/ARM_Compiler_5.06u6/bin64
RUN sh /tmp/install.sh
RUN mkdir -p /root/.wine/drive_c && unzip /tmp/Keil_v5.zip -d /root/.wine/drive_c && unzip /tmp/mdk_elmaps.zip && mv *.elmap /usr/local/ARM_Compiler_5.06u6/sw/mappings

ENTRYPOINT ["/entrypoint.sh"]
