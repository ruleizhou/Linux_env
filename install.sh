#!/bin/bash

# export 
export work_path=/home/work
export linux_env=$PWD

./linux_sh/envsetup_linux.sh
source ~/.bashrc
./linux_sh/install_tools.sh