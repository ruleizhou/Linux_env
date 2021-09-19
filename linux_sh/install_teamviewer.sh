#!/bin/bash

type teamviewer
if [ $? -eq 0 ]; then
    echo "Already install teamviewer"
else
    echo "install teamviewer"
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    sudo apt install ./teamviewer_amd64.deb
    sudo apt-get install -f
    sudo teamviewer --passwd 13262888498
    rm ./teamviewer_amd64.deb
fi
