#!/bin/bash

type tmux
if [ $? -eq 0 ]; then
    echo "Already install tmux"
else
    echo "echo install tmux"
    sudo apt-get install tmux  --fix-missing -y
fi

if [ -f ~/.tmux.conf ]; then
    echo "Already cp tmux.conf"
else
    echo "copy tmux.conf "
    cp $linux_env/linux_sh/config/tmux.conf ~/.tmux.conf
fi
