#!/bin/bash

if [ $# != 2 ];then
	echo "+++++++++++++++++++++++++++++++++++"
	echo "please use for this"
	echo "find_back.sh find_name back_name"
	echo "+++++++++++++++++++++++++++++++++++"
	exit 1;
fi

source_dir=`pwd`

find_name=$1
back_name=$2
file=find_back.tar.gz
back_dir=/home/han/file_backup/find_back/$back_name
#destination=$back_dir\/$file;
destination=$back_dir\/$file;
find_file="find.log";

mkdir -p $back_dir
cd $source_dir
#find . -iname "$find_name" > $find_file
find . -path "./out" -prune -o -iname "$find_name" > $find_file
sed -i 's/\.\/out//' $find_file

if [ -f $find_file ]
	then
		echo "load $find_file";
	else
    	echo "Sorry,can not find config file $find_file";
    	exit 1;
fi
file_number=0;
exec < $find_file;
read file_name;
while [ $? -eq 0 ]  # read命令执行结果为0
	do
	    if [ -f $file_name -o -d $file_name ] #-o 表示or
	    then
	        file_list="$file_list "$file_name;
	    else
	        echo "$file_name does not exist";
	        echo "the number is $file_number";
	    fi
	    file_number=$[ $file_number + 1 ];
	    read file_name;
	done
tar -czPf $destination $file_list
echo "destination $destination"
echo "rm find_file $find_file"
#rm $find_file 
echo "tar && rm find_back.tar.gz"
cd $back_dir
tar -xzf $file
rm $file
cd $source_dir

