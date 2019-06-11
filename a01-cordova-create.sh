#!/bin/bash


echo "Enter a folder name, no spaces, no dashes, underscore allowed, for your app and folder example: helloWorld"
read wow4

cordova create $wow4 com.$wow4.$wow4 $wow4 

cd $wow4


cordova platform add android


cordova build android --no-telemetry



cp /workspace/my-gitpod-ionic-cordova/$wow4/platforms/android/app/build/outputs/apk/debug/app-debug.apk /workspace/my-gitpod-ionic-cordova/public/$wow4-app-debug.apk



qrcode -o /workspace/my-gitpod-ionic-cordova/public/qrout.png $(gp url 8001);
echo "<br><img src='qrout.png'><br>" >> /workspace/my-gitpod-ionic-cordova/public/index.html

echo "<li><a href="$wow4-app-debug.apk">$wow4-app-debug.apk</a><br>" >> /workspace/my-gitpod-ionic-cordova/public/index.html


#open the preview pane
gp preview $(gp url 8001)

#echo "Refresh your web browser!"
