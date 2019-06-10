FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y default-jdk \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN npm install -g cordova ionic qrcode



USER gitpod


RUN mkdir -p /home/gitpod/rocksetta/logs                        \ 
    && touch /home/gitpod/rocksetta/logs/mylogs.txt             \
    && echo "Can not get android platforms to install will have to use the .gitpod.yml file\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 


RUN echo "Good bye from the Dockerfile build\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 


# Give back control
USER root
# Cleaning
RUN apt-get clean
