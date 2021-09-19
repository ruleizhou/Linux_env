#!/bin/bash

type git
if [ $? -eq 0 ]; then
    echo "Already install git"
else
    echo "echo install git"
    sudo apt-get install git curl wget --fix-missing -y
fi

type repo
if [ $? -eq 0 ]; then
    echo "Already install repo"
else
    echo "echo install repo"
    sudo apt-get install  curl --fix-missing -y
    curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o $linux_env/linux/bin/repo
    chmod +x $linux_env/linux/bin/repo
    echo "export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'" >> $linux_env/config/bashrc
fi

if [ -d ~/.ssh ]; then
    echo "Already cp ssh"
else
    echo "copy ssh && git-template "
    cp $linux_env/linux_sh/git_template/git-template ~/.git-template
    cp $linux_env/linux_sh/ssh ~/.ssh -rf
    sudo chown $USER:$USER ~/.ssh -R
    chmod 600 ~/.ssh/id_rsa
fi

git config --global user.name "zhourl"
git config --global user.email "zhourl@deepblueai.com"
git config --global commit.template ~/.git-template
git config --global core.editor "vim"
git config --global credential.helper store
git config --global core.autocrlf input
git config --global  http.postBuffer 524288000
git config --global url."https://github.com.cnpmjs.org".insteadOf https://github.com
