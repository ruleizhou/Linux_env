#!/bin/bash
type xed
if [ $? -eq 0 ]; then
    echo "Already install xed"
else
    echo "install xed"
    sudo add-apt-repository ppa:embrosyn/xapps
    sudo apt-get install xed  --fix-missing -y
fi
