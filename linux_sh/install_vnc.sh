#!/bin/bash

if [ -f /lib/systemd/system/x11vnc.service ]; then
    echo "already install vnc"
else
    echo "install vnc"
    sudo apt-get install x11vnc --fix-missing -y
    sudo apt-get install  xrdp --fix-missing -y
    sudo apt-get install remmina --fix-missing -y

    echo "Generate password"
    x11vnc -storepasswd

    echo "Set to boot service"
    sudo cp $linux_env/linux_sh/vnc/x11vnc.service /lib/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable x11vnc.service
fi
