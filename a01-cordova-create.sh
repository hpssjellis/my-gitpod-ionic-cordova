#!/bin/bash

#export ANDROID_SDK_ROOT="/workspace/rocksetta-gitpod-links/android/"
#echo $ANDROID_SDK_ROOT

#export PATH="${PATH}:${ANDROID_HOME}tools/:${ANDROID_HOME}platform-tools/"
#export PATH="${PATH}:$/workspace/rocksetta-gitpod-links/cordova/node_modules/:/workspace/rocksetta-gitpod-links/cordova/node_modules/cordova/bin:/workspace/rocksetta-gitpod-links/cordova/node_modules/qrcode/bin"

#echo $PATH


#start the web server
apachectl start

echo "Enter a folder name, no spaces, no dashes, underscore allowed, for your app and folder example: helloWorld"
read wow4

cordova create $wow4 com.$wow4.$wow4 $wow4 
#cordova create hello com.example.hello HelloWorld


cd $wow4


cordova platform add android


cordova build android --no-telemetry



cp /workspace/my-gitpod-dockerfile-cordova/$wow4/platforms/android/app/build/outputs/apk/debug/app-debug.apk /workspace/my-gitpod-dockerfile-cordova/public/$wow4-app-debug.apk



qrcode -o /workspace/my-gitpod-dockerfile-cordova/public/qrout.png $(gp url 8001);
echo "<br><img src='qrout.png'><br>" >> /workspace/my-gitpod-dockerfile-cordova/public/index.html

#printf "\n\n<a href='$wow4/platforms/android/app/build/outputs/apk/$wow4-debug.apk'>$wow4/platforms/android/app/build/outputs/apk/$wow4-debug.apk

echo "<li><a href="$wow4-app-debug.apk">$wow4-app-debug.apk</a><br>" >> /workspace/my-gitpod-dockerfile-cordova/public/index.html


#open the preview pane
gp preview $(gp url 8001)

#echo "Refresh your web browser!"
