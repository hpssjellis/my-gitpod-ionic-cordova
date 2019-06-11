FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y default-jdk \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*




USER gitpod
  
RUN mkdir -p /home/gitpod/rocksetta                                                                            \ 
    && mkdir -p /home/gitpod/rocksetta/logs                                                                    \ 
    && mkdir -p /home/gitpod/.android                                                                          \
    && touch /home/gitpod/rocksetta/logs/mylogs.txt                                                            \
    && echo "Installation start, made some folders in /home/gitpod" >> /home/gitpod/rocksetta/logs/mylogs.txt  \
    && echo "Try installing cordova, ionic, qrcode" >> /home/gitpod/rocksetta/logs/mylogs.txt                  \
    && npm install -g cordova ionic qrcode                                                                     \
    && echo "Back to root to install the Android sdk" >> /home/gitpod/rocksetta/logs/mylogs.txt                
    





# Give back control
USER root



WORKDIR /home/gitpod/.android


RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip     \
    && unzip sdk-tools-linux-4333796.zip                                          \                                                             
    && rm sdk-tools-linux-4333796.zip                                             \
    && chmod 775 -R /home/gitpod/.android                                         \
    && yes | /home/gitpod/.android/tools/bin/sdkmanager "build-tools;26.0.3" "platforms;android-26"  


USER gitpod


RUN  echo "Here is the android sdk" >> /home/gitpod/rocksetta/logs/mylogs.txt             \
     && ls -ls /home/gitpod/.android >> /home/gitpod/rocksetta/logs/mylogs.txt   \
     &&  echo "Installation all done" >> /home/gitpod/rocksetta/logs/mylogs.txt          


# Give back control
USER root


# Cleaning
RUN apt-get clean
