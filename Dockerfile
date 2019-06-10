FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install -y default-jdk \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

 
 ENV ANDROID_SDK_ROOT /home/gitpod
 ENV ANDROID_HOME /home/gitpod
 ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
 

# test more android installation


#RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip       \
#    && unzip sdk-tools-linux-4333796.zip    \
#    && rm sdk-tools-linux-4333796.zip   
    
    
#RUN yes | sdkmanager --licenses && yes | sdkmanager --update


    #\
    #&& /home/github/tools/bin/sdkmanager --update
    #\
   # && RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn  ./android/tools/bin/sdkmanager --licenses "platform-tools" "build-tools;28.0.3" "platforms;android-28"    ; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '




# --- Install Gradle from PPA

# Gradle PPA
# RUN apt-get update \
# && apt-get -y install gradle \
# && gradle -v



USER gitpod






RUN mkdir -p /home/gitpod/rocksetta/logs                        \ 
    && mkdir -p /home/gitpod/rocksetta/android                  \ 
    && mkdir -p /home/gitpod/rocksetta/qrcode-cordova           \
    && touch /home/gitpod/rocksetta/logs/mylogs.txt             \
    && wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip       \
    && unzip sdk-tools-linux-4333796.zip -d /home/gitpod/rocksetta/android             \
    && rm sdk-tools-linux-4333796.zip                                                  \  
    && chmod 755 -R /home/gitpod/rocksetta 
    
    #&& chmod 755 /home/gitpod/rocksetta/android/tools/bin/sdkmanager                   
 
    # && chmod 755 -R /home/gitpod/rocksetta    
 
 RUN echo "Hello from the Dockerfile build\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 

 
 ENV ANDROID_SDK_ROOT /home/gitpod/rocksetta/android
 ENV ANDROID_HOME /home/gitpod/rocksetta/android
 ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
 ENV PATH ${PATH}:/home/gitpod/rocksetta/:/home/gitpod/rocksetta/qrcode-cordova:/home/gitpod/rocksetta/qrcode-cordova/node_modules:/home/gitpod/rocksetta/qrcode-cordova/node_modules/cordova/bin:/home/gitpod/rocksetta/qrcode-cordova/node_modules/qrcode/bin
 
 
 #RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn '"${ANDROID_HOME}"'/tools/bin/sdkmanager --licenses; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '
 
 #RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn  sdkmanager --licenses; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '
 
 #RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn  sdkmanager --licenses "platform-tools" "build-tools;28.0.3" "platforms;android-28"    ; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '

 #RUN #!/bin/bash /usr/bin/expect -c ' cd /home/gitpod/rocksetta/android;   set timeout -1; spawn  sdkmanager --licenses "platform-tools" "build-tools;28.0.3" "platforms;android-28"    ; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '



# ----install Cordova and qrcode, could also install ionic here

RUN npm --prefix /home/gitpod/rocksetta/qrcode-cordova install cordova qrcode







#USER root


# Install the android software tools. Needs a fancy loop to accept licenses


#RUN echo "Where are we before WORKDIR\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 
#RUN pwd >> /home/gitpod/rocksetta/logs/mylogs.txt 


#WORKDIR /home/gitpod/rocksetta/android/


#RUN echo "Where are we after WORKDIR change\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 
#RUN pwd >> /home/gitpod/rocksetta/logs/mylogs.txt 

#RUN  ./tools/bin/sdkmanager --list

#RUN #!/bin/bash /usr/bin/expect -c ' set timeout -1; spawn  sdkmanager --licenses "platform-tools" "build-tools;28.0.3" "platforms;android-28"    ; expect { "y/N" { exp_send "y\r" ; exp_continue } eof} '

#RUN ls -la >> /home/gitpod/rocksetta/logs/mylogs.txt 

 
#----- specific to gitpod
#USER gitpod
   #RUN chmod +x a01-create.sh && chmod +x a02-re-build.sh && chmod +x a03-copy-to-folder.sh
   
   







USER gitpod

RUN echo "Can not get android platforms to install will have to use the .gitpod.yml file\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 


RUN echo "Good bye from the Dockerfile build\n" >> /home/gitpod/rocksetta/logs/mylogs.txt 


# Give back control
USER root
# Cleaning
RUN apt-get clean
