#!/bin/bash


# just finding the files
cd /home/gitpod/.android

ls -la

echo "Let us run the sdkmanager"

./home/gitpod/.android/tools/bin/sdkmanager --list


# commented out how to install platform 26

#yes | ./home/gitpod/.android/tools/bin/sdkmanager "build-tools;26.0.3" "platforms;android-26"


