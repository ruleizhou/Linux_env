#!/bin/bash
. ~/.bashrc
type minicom
if [ $? -eq 0 ]; then
    echo "Already install minicom"
else
    echo "install minicom"
    sudo apt-get install minicom --fix-missing -y

    sudo gpasswd --add $USER dialout
    sudo usermod -a -G tty $USER
fi
