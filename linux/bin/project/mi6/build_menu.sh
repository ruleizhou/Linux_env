#!/bin/bash
RED_COLOR='\E[1;31m'  #红
YELOW_COLOR='\E[1;33m' #黄
GREEN_COLOR='\E[1;35m' #黄
RES='\E[0m'

Project=mi6
line_name=(
        MI6_VIVE_Global_N71_CRC_Sense90GP_Stable        
)

while :
do
    clear -x
    echo -e "${YELOW_COLOR}build menu${RES}"
    for((i=0;i<${#line_name[@]};i++)) do
        echo -e "${YELOW_COLOR}[${i} ] ${line_name[i]}${RES}"
    done
    
    read -p "Select:" answer
    case ${answer} in
        [0-9] )
            . $han_build_dir/project/$Project/${line_name[answer]}.sh
            break
        ;;
        [0-9][0-9] )
            . $han_build_dir/project/$Project/${line_name[answer]}.sh
            break
        ;;
        e|E )
            break
        ;;
        * )
            echo -e "${RED_COLOR}===Invalid input operation===${RES}"
            continue
        ;;
    esac   
done

