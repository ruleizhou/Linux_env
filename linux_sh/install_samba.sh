#!/bin/bash
. ~/.bashrc
type samba
if [ $? -eq 0 ]; then
    echo "Already install samba"
else
    echo "install Samba"
    sudo apt-get install samba --fix-missing -y
	sudo apt-get -y install smbclient cifs-utils
    echo "config share file"
    dir=$(ls -l $work_path |awk '/^d/ {print $NF}')
    for i in $dir
    do
	    sudo sh -c "echo '[$i]' >> /etc/samba/smb.conf"
	    sudo sh -c "echo '\tcomment = $i' >> /etc/samba/smb.conf"
	    sudo sh -c "echo '\tpath = $work_path/$i' >> /etc/samba/smb.conf"
	    sudo sh -c "echo '\twritable = yes' >> /etc/samba/smb.conf"
	    sudo sh -c "echo '\tbrowseable = yes' >> /etc/samba/smb.conf"
    done
    sudo useradd $USER
    sudo smbpasswd -a $USER
	echo "alias ${USER}_mount_${USER}='sudo mount -t cifs -o username=$USER,password=$USER,uid=$USER,gid=$USER //10.33.24.64/$USER /home/work/share/$USER'" >> $linux_env/config/bash_aliases
	echo "alias ${USER}_mount_htc='sudo mount -t cifs -o username=$USER,password=$USER,uid=$USER,gid=$USER //10.33.24.64/htc /home/work/share/htc'" >> $linux_env/config/bash_aliases
	. ~/.bashrc
fi
