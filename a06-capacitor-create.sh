#!/bin/bash



echo "The App must have been built with a04-ionic-start.sh"
echo "Enter a folder name of the app you wish to re-build"
read wow4





npx @capacitor/cli create --npm-client npm  $wow4 $wow4 com.$wow4.$wow4 $wow4





cd $wow4


npx cap add android
#npx cap open android
npx cap serve

#echo "Not sure how this works"
