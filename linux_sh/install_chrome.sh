#!/bin/bash

type google-chrome
if [ $? -eq 0 ]; then
    echo "Already install google-chrome"
else
    echo "install chrome"
    wget -O google-chrome.deb  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
    sudo apt-get -y install ./google-chrome.deb --fix-broken
    rm google-chrome.deb 
fi
