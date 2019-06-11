#!/bin/bash



echo "The App must have been built with a01-create.sh"
echo "Enter a folder name of the app you wish to re-build"
read wow4

#cordova create $wow4 com.$wow4.$wow4 $wow4
#cordova create hello com.example.hello HelloWorld


cd $wow4


#cordova platform add android

cordova build android --no-telemetry


# backup old .apk
cp /workspace/my-gitpod-ionic-cordova/public/$wow4-app-debug.apk /workspace/my-gitpod-ionic-cordova/public/$wow4-backup-app-debug.apk

#copy new .apk to the public folder
cp /workspace/my-gitpod-ionic-cordova/$wow4/platforms/android/app/build/outputs/apk/debug/app-debug.apk /workspace/my-gitpod-ionic-cordova/public/$wow4-app-debug.apk

echo "<li> Next rebuild <a href="$wow4-app-debug.apk">$wow4-app-debug.apk</a><br>" >> /workspace/my-gitpod-ionic-cordova/public/index.html


echo "Refresh your web browser!"
echo "You must delete your old download on your phone or the installation will give an error as the file name has changed"
