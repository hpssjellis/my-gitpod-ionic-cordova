FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y default-jdk \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*




USER gitpod


RUN mkdir -p /home/gitpod/rocksetta/logs                                                                                               \
    mkdir -p /home/gitpod/rocksetta/android                                                                                            \ 
    && touch /home/gitpod/rocksetta/logs/mylogs.txt                                                                                    \
    && echo "Can not get android platforms to install will have to use the .gitpod.yml file" >> /home/gitpod/rocksetta/logs/mylogs.txt \
    && echo "Try installing cordova etc" >> /home/gitpod/rocksetta/logs/mylogs.txt                                                     \
    && npm install -g cordova ionic qrcode                                                                                             \
    && echo "Good bye from the Dockerfile buildn" >> /home/gitpod/rocksetta/logs/mylogs.txt                                            \
    && echo "Good bye from the Dockerfile build" >> /home/gitpod/rocksetta/logs/mylogs.txt 

ADD https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
    && unzip sdk-tools-linux-4333796.zip -d /home/gitpod/rocksetta/android  

# Give back control
USER root
# Cleaning
RUN apt-get clean
