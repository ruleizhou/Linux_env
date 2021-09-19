#!/bin/bash

# Desktop
if [ -n "$DESKTOP_SESSION" ]; then
	echo "DESKTOP_SESSION=$DESKTOP_SESSION"
	type fcitx
	if [ $? -eq 0 ]; then
		echo "Already install fcitx"
	else
		sudo apt-get install fcitx fcitx-pinyin --fix-missing -y
	fi
	type openconnect
	if [ $? -eq 0 ]; then
		echo "Already install openconnect"
	else
		sudo apt-get install openconnect gvfs-backends --fix-missing -y
	fi
	type seahorse
	if [ $? -eq 0 ]; then
		echo "Already install seahorse"
	else
		sudo apt-get install seahorse --fix-missing -y
	fi
else
	echo "Debian Server" 
fi

sudo apt-get -y install bc qt5-qmake zlib1g-dev
#sudo apt-get -y install build-essential cmake qtbase5-dev libqt5x11extras5-dev qttools5-dev qttools5-dev-tools libgcrypt20-dev zlib1g-dev libxi-dev libxtst-dev

sudo cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

type ifconfig
if [ $? -eq 0 ]; then
	echo "Already install net-tools"
else
	sudo apt-get -y install net-tools
	echo "export PATH=\$PATH:/sbin:/usr/sbin" >> $linux_env/config/bashrc
fi

sudo apt-get -y install bash-completion
if [ `grep -c "bash_completion" ~/.bashrc` -ne 0 ]; then
    echo "Already install bash-completion"
else
	echo "if [ -f /etc/bash_completion ]; then" >> ~/.bashrc
	echo -e "\t. /etc/bash_completion" >> ~/.bashrc
	echo "fi" >> ~/.bashrc
fi

. ~/.bashrc

