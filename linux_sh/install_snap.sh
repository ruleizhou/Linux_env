#!/bin/bash
type snap
if [ $? -eq 0 ]; then
    echo "Already install snap"
else
    echo "install snap"
    sudo apt-get update
    sudo apt-get install snapd  --fix-missing -y
    echo "Import environment variables"
    echo "export PATH=/snap/bin:\$PATH" >> $linux_env/config/bashrc
    echo "export XDG_DATA_DIRS=/var/lib/snapd/desktop:\$XDG_DATA_DIRS" >> $linux_env/config/bashrc
	. ~/.bashrc
fi
