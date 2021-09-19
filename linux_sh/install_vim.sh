#!/bin/bash

sudo apt-get remove exuberant-ctags
type vim
if [ $? -eq 0 ]; then
    echo "Already install vim"
else
    echo "echo install vim"
    sudo apt-get install vim  --fix-missing -y
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

if [ -d ~/.vim ]; then
    echo "Already cp config vim"
else
    echo "copy vim config "
	mkdir ~/.vim -p
    cp $linux_env/linux_sh/vim_neovim/common/* ~/.vim -rf
    cp $linux_env/linux_sh/vim_neovim/vim/plugs.vim ~/.vim
    cp $linux_env/linux_sh/vim_neovim/vim/vimrc ~/.vimrc
fi
