#!/bin/bash
RED_COLOR='\E[1;31m'  #红
YELOW_COLOR='\E[1;33m' #黄
GREEN_COLOR='\E[1;35m' #黄
RES='\E[0m'

install_xed=false
install_snap=false
install_cisco=false
install_chrome=false
install_goldendict=false
install_samba=false
install_gitbook=false
install_minicom=false
install_understand=false
install_android_sdk=false
install_motrix=false
install_tmux=false
install_vim=false
install_neovim=false

# linux os 
isLinux=`cat /etc/issue|grep -Eo "Debian|Mint|Ubuntu|Xubuntu"`

#install tools
while :
do
    clear -x
	# samba
    if  [ $install_samba == false ]; then
        echo -e "${YELOW_COLOR}[0 ] install samba${RES}"
    else
        echo -e "${GREEN_COLOR}[0 ] install samba(ok)${RES}"
    fi
	# goldendict
    if  [ $install_goldendict == false ]; then
        echo -e "${YELOW_COLOR}[1 ] install goldendict${RES}"
    else
        echo -e "${GREEN_COLOR}[1 ] install goldendict(ok)${RES}"
    fi
	# gitbook
    if  [ $install_gitbook == false ]; then
        echo -e "${YELOW_COLOR}[2 ] install gitbook ${RES}"
    else
        echo -e "${GREEN_COLOR}[2 ] install gitbook(ok)${RES}"
    fi
	 # chrome
    if  [ $install_chrome == false ]; then
        echo -e "${YELOW_COLOR}[3 ] install chrome${RES}"
    else
        echo -e "${GREEN_COLOR}[3 ] install chrome(ok)${RES}"
    fi
	# minicom
    if  [ $install_minicom == false ]; then
        echo -e "${YELOW_COLOR}[4 ] install minicom${RES}"
    else
        echo -e "${GREEN_COLOR}[4 ] install minicom(ok)${RES}"
    fi
    # understand
    if  [ $install_understand == false ]; then
        echo -e "${YELOW_COLOR}[5 ] install understand${RES}"
    else
        echo -e "${GREEN_COLOR}[5 ] install understand(ok)${RES}"
    fi
    # android_sdk
    if  [ $install_android_sdk == false ]; then
        echo -e "${YELOW_COLOR}[6 ] install android_sdk${RES}"
    else
        echo -e "${GREEN_COLOR}[6 ] install android_sdk(ok)${RES}"
    fi
	# motrix
    if  [ $install_motrix == false ]; then
        echo -e "${YELOW_COLOR}[7 ] install motrix download tool${RES}"
    else
        echo -e "${GREEN_COLOR}[7 ] install motrix download tool(ok)${RES}"
    fi
	# tmux
    if  [ $install_tmux == false ]; then
        echo -e "${YELOW_COLOR}[8 ] install tmux${RES}"
    else
        echo -e "${GREEN_COLOR}[8 ] install tmux(ok)${RES}"
    fi
    # cisco
    if  [ $install_cisco == false ]; then
        echo -e "${YELOW_COLOR}[20] install cisco${RES}"
    else
        echo -e "${GREEN_COLOR}[20] install cisco(ok)${RES}"
    fi
	# xed
    if  [ $install_xed == false ]; then
        echo -e "${YELOW_COLOR}[21] install xed${RES}"
    else
        echo -e "${GREEN_COLOR}[21] install xed(ok)${RES}"
    fi  
    # snap
    if  [ $install_snap == false ]; then
        echo -e "${YELOW_COLOR}[22] install snap${RES}"
    else
        echo -e "${GREEN_COLOR}[22] install snap(ok)${RES}"
    fi
    # vim
    if  [ $install_vim == false ]; then
        echo -e "${YELOW_COLOR}[23] install vim${RES}"
    else
        echo -e "${GREEN_COLOR}[23] install vim(ok)${RES}"
    fi
    # neovim
    if  [ $install_neovim == false ]; then
        echo -e "${YELOW_COLOR}[24] install neovim${RES}"
    else
        echo -e "${GREEN_COLOR}[24] install neovim(ok)${RES}"
    fi
    # exit
    echo -e "${YELOW_COLOR}[e] Exit${RES}"

    
    read -p "Select:" answer
    case ${answer} in
		 0 )
            echo -e "${YELOW_COLOR}start install samba${RES}"
            .  $linux_env/linux_sh/install_samba.sh
            install_samba=true
            continue
        ;;
		1 )
            echo -e "${YELOW_COLOR}start install goldendict${RES}"
            .  $linux_env/linux_sh/install_goldendict.sh
            install_goldendict=true
            continue
        ;;
        2 )
            echo -e "${YELOW_COLOR}start install gitbook${RES}"
            .  $linux_env/linux_sh/install_gitbook.sh
            install_gitbook=true
            continue
        ;;
		3 )
            echo -e "${YELOW_COLOR}star tinstall chrome${RES}"
            .  $linux_env/linux_sh/install_chrome.sh
            install_chrome=true
            continue
        ;;
        4 )
            echo -e "${YELOW_COLOR}start install minicom${RES}"
            .  $linux_env/linux_sh/install_minicom.sh
            install_minicom=true
            continue
        ;;
        5 )
            echo -e "${YELOW_COLOR}start install understand${RES}"
            .  $linux_env/linux_sh/install_understand.sh
            install_understand=true
            continue
        ;;
        6 )
            echo -e "${YELOW_COLOR}start install android_sdk${RES}"
            .  $linux_env/linux_sh/install_android_sdk.sh
            install_android_sdk=true
            continue
        ;;
		7 )
            echo -e "${YELOW_COLOR}start install motrix download tool${RES}"
            .  $linux_env/linux_sh/install_motrix.sh
            install_motrix=true
            continue
        ;;
		8 )
            echo -e "${YELOW_COLOR}start install tmux${RES}"
            .  $linux_env/linux_sh/install_tmux.sh
            install_tmux=true
            continue
        ;;
        20 )
            echo -e "${YELOW_COLOR}start install cisco${RES}"
            .  $linux_env/linux_sh/install_cisco.sh
            install_cisco=true
            continue
        ;;
		21 )
            echo -e "${YELOW_COLOR}start install xed${RES}"
            .  $linux_env/linux_sh/install_xed.sh
            install_xed=true
            continue
        ;;
        22 )
            echo -e "${YELOW_COLOR}start install snap${RES}"
            .  $linux_env/linux_sh/install_snap.sh
            install_snap=true
            continue
        ;;
        23 )
            echo -e "${YELOW_COLOR}start install vim${RES}"
            .  $linux_env/linux_sh/install_vim.sh
            install_vim=true
            continue
        ;;
        24 )
            echo -e "${YELOW_COLOR}start install neovim${RES}"
            .  $linux_env/linux_sh/install_neovim.sh
            install_neovim=true
            continue
        ;;
        e|E )
            if  [ $install_goldendict == true ]; then
                echo -e "${RED_COLOR}Please config goldendict${RES}"
                echo -e "${RED_COLOR}编译-->词典-->程序-->添加${RES}"
                echo -e "${RED_COLOR}类型: 纯文本${RES}"
                echo -e "${RED_COLOR}名称: google${RES}"
                echo -e "${RED_COLOR}命令: trans -e google -s en -t zh-CN -show-original y -show-original-phonetics n -show-translation y -no-ansi -show-translation-phonetics n -show-prompt-message n -show-languages y -show-original-dictionary n -show-dictionary n -show-alternatives n "%GDWORD%" ${RES}"
            fi
            if  [ $install_cisco == true ]; then
                echo -e "${RED_COLOR}connet     vpncn.htc.com${RES}"
                echo -e "${RED_COLOR}name       xxxxxx@xx.com${RES}"
                echo -e "${RED_COLOR}Password   xxxxxxxxxxxxx${RES}"
            fi
            break
        ;;
        * )
            echo -e "${RED_COLOR}===Invalid input operation===${RES}"
            continue
        ;;
    esac
done
