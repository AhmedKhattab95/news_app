#!/usr/bin/env bash
#Place this script in project/android/app/

cd ..

# fail if any command fails
set -e
# debug log
set -x
cd ..
# clone flutter build 1.22.1 could remove and clone from stable channel from this command
git clone -b stable https://github.com/flutter/flutter.git
#git clone --depth 1 --branch 1.22.1 https://github.com/flutter/flutter.git

export PATH=`pwd`/flutter/bin:$PATH

git update-index --chmod=+x android/gradlew
chmod a+rx android/gradlew

#flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

# build APK
flutter build apk --release

# if you need build bundle (AAB) in addition to your APK, uncomment line below and last line of this script.
#flutter build appbundle

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_

# copy the AAB where AppCenter will find it
#mkdir -p android/app/build/outputs/bundle/; mv build/app/outputs/bundle/release/app.aab $_
