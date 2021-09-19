#!/bin/bash

RED_COLOR='\E[1;31m'  #红
YELOW_COLOR='\E[1;33m' #黄
GREEN_COLOR='\E[1;35m' #黄
RES='\E[0m'

name=embedded
source_dir=`pwd`
image_file=$source_dir/sources/kernel/kernel-4.9/out/arch/arm64/boot/Image
cd $source_dir
#find . -iname "$find_name" > $find_file
read -p "IP:" IP_addr
echo "scp Image to ~/"
scp $image_file $name@$IP_addr:~/
echo -e "${RED_COLOR}[1] sudo cp ~/Image /boot${RES}"
echo -e "${RED_COLOR}[2] Reboot Nvidia${RES}"
ssh $name@$IP_addr
