#!/bin/bash

if [ `grep -c "add by $USER for set" ~/.bashrc` -ne 0 ]; then
    echo "Already install env for $USER"
else
    echo "update source.list"
    sudo apt-get update

    echo "install lib"
    sudo apt-get install openssh-server vim meld policycoreutils --fix-missing -y
    sudo apt-get install libssl-dev liblz4-tool clang --fix-missing -y
    sudo apt-get install libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev --fix-missing -y
    sudo apt-get install flex bison gperf build-essential dpkg-dev libsdl1.2-dev --fix-missing -y
    sudo apt-get install git git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev --fix-missing -y
    sudo apt-get install build-essential  libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev --fix-missing -y
    sudo apt-get install libx11-dev libgl1-mesa-dev libxml2-utils xsltproc unzip m4 lib32z-dev ccache  --fix-missing -y
    sudo apt-get install tofrodos python-markdown libxml2-utils xsltproc  make policycoreutils-python-utils --fix-missing -y
    sudo apt-get install libxml-simple-perl lib32z1 --fix-missing -y
    sudo apt-get install gitk tree --fix-missing -y
    sudo apt-get install libswitch-perl  --fix-missing -y
    sudo apt-get install apt-file --fix-missing -y
    sudo apt-get install usb-creator-gtk --fix-missing -y
    sudo apt-get install apt-transport-https ca-certificates cmake libatlas-base-dev libcurl4-openssl-dev libjemalloc-dev liblapack-dev libopenblas-dev libopencv-dev libzmq3-dev ninja-build python-dev python3-dev software-properties-common unzip virtualenv --fix-missing -y
    sudo apt-file update

    echo "install openjdk-8"
    sudo apt-get install openjdk-8-jdk --fix-missing -y
    sudo update-alternatives --config java

	sudo apt -y install locales
	sudo dpkg-reconfigure locales

    #echo "export LC_ALL=C" >> $linux_env/config/bashrc
	if [ -f $linux_env/config/bash_aliases ]; then
		echo "bash_aliases already exists"
	else 
		touch $linux_env/config/bash_aliases
	fi
	if [ -f $linux_env/config/bashrc ]; then
		echo "bash_aliases already exists"
	else 
		touch $linux_env/config/bashrc
	fi
	
	mkdir $linux_env/linux/tool -p
	echo "export linux_env=$linux_env" >> $linux_env/config/bashrc
	echo "export work_path=$work_path" >> $linux_env/config/bashrc
    echo "export PATH=\$linux_env/linux/bin:\$PATH" >> $linux_env/config/bashrc

    echo "import bash_aliases to ~/.bashrc"
    echo "# add by $USER for set" >> ~/.bashrc
    echo "if [ -f $(pwd)/config/bash_aliases ]; then" >> ~/.bashrc
    echo -e "\t. $(pwd)/config/bash_aliases" >> ~/.bashrc
    echo "fi" >> ~/.bashrc

    echo "import sh to ~/.bashrc"
    echo "if [ -f $(pwd)/config/linux_envsetup.sh ]; then" >> ~/.bashrc
    echo -e "\t. $(pwd)/config/linux_envsetup.sh" >> ~/.bashrc
    echo "fi" >> ~/.bashrc

    echo "if [ -f $(pwd)/config/bashrc ]; then" >> ~/.bashrc
    echo -e "\t. $(pwd)/config/bashrc" >> ~/.bashrc
    echo "fi" >> ~/.bashrc

    echo "source ~/.bashrc"
    . ~/.bashrc
fi
