#!/bin/bash
if [ -d $HOME/$USER/go ]; then
    echo "go already install"
else
    echo "install go env and IDE"
    mkdir $HOME/$USER/go -p
    mkdir $HOME/$USER/go/env
    mkdir $HOME/$USER/go/ide
    mkdir $HOME/$USER/go/project
    sudo apt-get install bison ed gawk  libc6-dev make --fix-missing -y
    
    wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
    tar -C $HOME/$USER/go/env -zxvf  go1.14.2.linux-amd64.tar.gz
    echo "export GOROOT=\$HOME/$USER/go/env/go" >> $linux_env/config/bashrc
    echo "export GOPATH=\$HOME/$USER/go/project" >> $linux_env/config/bashrc
    echo "export PATH=\$GOROOT/bin:$PATH" >> $linux_env/config/bashrc
	export GOROOT=$HOME/$USER/go/env/go
	export GOPATH=$HOME/$USER/go/env/go
	export PATH=$GOROOT/bin:$PATH
    rm go1.14.2.linux-amd64.tar.gz
fi

if [ -d $linux_env/linux/tool/liteide ]; then
    echo "liteide already install"
else
    echo "install liteide"
    ## Git clone and build liteide ##
    sudo apt-get install qt5-default --fix-missing -y
    git clone https://github.com/visualfc/liteide.git
    cd liteide/build
    ./update_pkg.sh
    ./build_linux_qt5.sh

    ## Deploy it: ##
    ./deploy_linux_x64_qt5.sh
    
    ## copy to linux/tool/liteide ##
    mv liteide $linux_env/linux/tool/liteide
    cd -
    rm liteide -rf    
fi

if [ -f ~/.local/share/applications/liteide.desktop ]; then
    echo "liteide.desktop already exists"
else
    ## create desktop ##
    touch ~/.local/share/applications/liteide.desktop
    echo "[Desktop Entry]" >> ~/.local/share/applications/liteide.desktop
    echo "Type=Application" >> ~/.local/share/applications/liteide.desktop
    echo "Name=liteide" >> ~/.local/share/applications/liteide.desktop
    echo "Icon=$linux_env/linux/tool/liteide/share/liteide/welcome/images/liteide400.png" >> ~/.local/share/applications/liteide.desktop
    echo "Exec=$linux_env/linux/tool/liteide/bin/liteide" >> ~/.local/share/applications/liteide.desktop
    echo "Comment=LiteIDE is a simple, open source, cross-platform Go IDE." >> ~/.local/share/applications/liteide.desktop
    echo "Terminal=false" >> ~/.local/share/applications/liteide.desktop
    echo "Categories=Development;IDE;" >> ~/.local/share/applications/liteide.desktop
    echo "Name[zh_CN]=liteide" >> ~/.local/share/applications/liteide.desktop
fi

