#!/bin/bash
type goldendict
if [ $? -eq 0 ]; then
    echo "Already install goldendict"
else
    echo "install goldendict"
    sudo apt-get install goldendict --fix-missing -y
fi
type trans
if [ $? -eq 0 ]; then
    echo "Already install trans"
else
	git clone https://github.com/soimort/translate-shell.git
    cd translate-shell
    make 
    sudo make install
    cd ..
    rm translate-shell -rf
fi
