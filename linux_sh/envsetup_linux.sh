#!/bin/bash
RED_COLOR='\E[1;31m'  #红
YELOW_COLOR='\E[1;33m' #黄
GREEN_COLOR='\E[1;35m' #黄
RES='\E[0m'

install_env=false
install_git=false
install_copy=false
install_theme=false
install_aliases=false

# linux os
isLinux=`cat /etc/issue|grep -Eo "Debian|Mint|Ubuntu|Xubuntu"`
echo -e "${GREEN_COLOR} Linux is $isLinux ${RES}"
if [ $isLinux == "Debian" ];then
	install_debian=false
fi

#install tools
while :
do
    clear -x
    # env
    if  [ $install_env == false ]; then
        echo -e "${YELOW_COLOR}[1 ] install env${RES}"
    else
        echo -e "${GREEN_COLOR}[1 ] install env(ok)${RES}"
    fi
    # copy
    if  [ $install_copy == false ]; then
        echo -e "${YELOW_COLOR}[2 ] install copy${RES}"
    else
        echo -e "${GREEN_COLOR}[2 ] install copy(ok)${RES}"
    fi
    # git
    if  [ $install_git == false ]; then
        echo -e "${YELOW_COLOR}[3 ] install git${RES}"
    else
        echo -e "${GREEN_COLOR}[3 ] install git(ok)${RES}"
    fi
    # aliases
    if  [ $install_aliases == false ]; then
        echo -e "${YELOW_COLOR}[4 ] install aliases${RES}"
    else
        echo -e "${GREEN_COLOR}[4 ] install aliases(ok)${RES}"
    fi
    # theme
    if  [ $install_theme == false ]; then
        echo -e "${YELOW_COLOR}[5 ] install theme${RES}"
    else
        echo -e "${GREEN_COLOR}[5 ] install theme(ok)${RES}"
    fi
	# Linux Debian env 
	if [ $isLinux == "Debian" ];then
		if  [ $install_debian == false ]; then
        	echo -e "${YELOW_COLOR}[6 ] install debian env${RES}"
    	else
        	echo -e "${GREEN_COLOR}[6 ] install debian env(ok)${RES}"
    	fi
	fi
    # exit
    echo -e "${YELOW_COLOR}[e] Exit${RES}"

    
    read -p "Select:" answer
    case ${answer} in
        1 )
            echo -e "${YELOW_COLOR}start install env${RES}"
            .  $linux_env/linux_sh/install_env.sh
            install_env=true
            continue
        ;;
        2 )
            echo -e "${YELOW_COLOR}star tinstall copy${RES}"
            .  $linux_env/linux_sh/install_copy.sh
            install_copy=true
            continue
        ;;
        3 )
            echo -e "${YELOW_COLOR}start install git${RES}"
            .  $linux_env/linux_sh/install_git.sh
            install_git=true
            continue
        ;;
        4 )
            echo -e "${YELOW_COLOR}start install aliases${RES}"
            .  $linux_env/linux_sh/install_aliases.sh
            install_aliases=true
            continue
        ;;
		5 )
            echo -e "${YELOW_COLOR}start install theme${RES}"
            .  $linux_env/linux_sh/install_theme.sh
            install_theme=true
            continue
        ;;
		6 )
            echo -e "${YELOW_COLOR}start install debian env${RES}"
            .  $linux_env/linux_sh/install_debian.sh
            install_debian=true
            continue
        ;;
        e|E )
            exit 1
        ;;
        * )
            echo -e "${RED_COLOR}===Invalid input operation===${RES}"
            continue
        ;;
    esac
done
