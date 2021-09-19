#!/bin/bash

type nvim
if [ $? -eq 0 ]; then
    echo "Already install neovim"
else
    echo "echo install neovim"
    sudo apt-get remove exuberant-ctags
    sudo apt-get install software-properties-common --fix-missing -y
    sudo apt-add-repository ppa:neovim-ppa/stable
    sudo apt update
    sudo apt-get install neovim  --fix-missing -y
fi

type rg
if [ $? -eq 0 ]; then
    echo "Already install ripgrep"
else
    echo "echo install ripgrep"
	sudo dpkg -i $linux_env/linux_sh/vim_neovim/deb/ripgrep_13.0.0_amd64.deb
fi

type gtags
if [ $? -eq 0 ]; then
    echo "Already install gtags"
else
    echo "echo install gtags"
	sudo apt install global --fix-missing -y
fi

type ctags
if [ $? -eq 0 ]; then
    echo "Already install universal-ctags"
else
    echo "echo install universal-ctags"
	git clone https://github.com/universal-ctags/ctags.git
	cd ctags
	./autogen.sh
	# --prefix=指定安装路径
	./configure
	make && sudo make install
	cd ..
	rm ctags
fi

if [ -d ~/.config/nvim ]; then
    echo "Already cp config nvim"
else
    echo "copy nvim config "
	mkdir ~/.config/nvim -p
    cp $linux_env/linux_sh/vim_neovim/common/* ~/.config/nvim -rf
    cp $linux_env/linux_sh/vim_neovim/neovim/* ~/.config/nvim
fi
