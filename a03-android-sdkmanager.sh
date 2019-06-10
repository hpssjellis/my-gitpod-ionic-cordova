#!/bin/bash

# Need this command to run the sdkmanager to install other android platforms

cd /workspace/my-gitpod-ionic-cordova

./android/tools/bin/sdkmanager --list


# The command to install Android Plafrom 26 would look something like this

yes | ./android/tools/bin/sdkmanager "build-tools;26.0.3" "platforms;android-26" 