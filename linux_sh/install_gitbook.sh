#!/bin/bash
. ~/.bashrc
isLinux=`cat /etc/issue|grep -Eo "Debian|Mint|Ubuntu|Xubuntu"`
if [ $isLinux == "Debian" ];then
	curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
fi
type node
if [ $? -eq 0 ]; then
    echo "Already install node"
else
    echo "install node.js"
    sudo apt-get install nodejs --fix-missing -y
fi

type npm
if [ $? -eq 0 ]; then
    echo "Already install npm"
else
    echo "install npm"
    sudo apt-get install npm --fix-missing -y
fi

type gitbook
if [ $? -eq 0 ]; then
    echo "Already install gitbook"
else
    echo "install gitboot-cli"
	sudo npm config set registry https://registry.npm.taobao.org
    sudo apt install npm --fix-missing -y
    sudo npm install -g gitbook-cli
fi

type hexo
if [ $? -eq 0 ]; then
    echo "Already install hexo"
else
    sudo npm install -g hexo-cli
fi

type typora
if [ $? -eq 0 ]; then
    echo "Already install typora"
else
    echo "install typora"
    sudo apt-get install software-properties-common --fix-missing -y
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./'
    sudo apt-get update
    sudo apt-get install typora --fix-missing -y
fi

if [ `grep -c "book" $linux_env/config/bash_aliases` -ne 0 ]; then
    echo "Already set git bash_aliases "
else
    echo "set alias book"
    temp_path=$USER
    if [ -d $work_path/$USER ]; then
        temp_path=$USER
    elif [ -d $work_path/htc ]; then
        temp_path=htc
    else
        echo "/home/work/htc or $USER not exists"
        exit 1;
    fi
    echo "alias book='cd \$work_path/$temp_path/book'" >> $linux_env/config/bash_aliases
	. ~/.bashrc
fi

