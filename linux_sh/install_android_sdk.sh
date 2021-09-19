#!/bin/bash
. ~/.bashrc
if [ `grep -c "ANDROID_SDK_HOME" $linux_env/config/bashrc` -ne 0 ]; then
    echo "Already install SDK "
    else
    if [ -d $linux_env/android/Sdk ]; then
        echo "install lib"
        sudo apt-get install libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 --fix-missing -y
        sudo apt-get  install --fix-broken -y
        
        echo "Import environment variables"
        echo "export ANDROID_SDK_HOME=\$linux_env/android/Sdk" >> $linux_env/config/bashrc
        echo "export PATH=\${ANDROID_SDK_HOME}/tools:\$PATH" >> $linux_env/config/bashrc
        echo "export PATH=\${ANDROID_SDK_HOME}/build-tools/28.0.3:\$PATH" >> $linux_env/config/bashrc
        echo "export PATH=\${ANDROID_SDK_HOME}/platform-tools:\$PATH" >> $linux_env/config/bashrc
		. ~/.bashrc
    else
        echo "Sdk not exist. Please download Sdk"
    fi
fi
