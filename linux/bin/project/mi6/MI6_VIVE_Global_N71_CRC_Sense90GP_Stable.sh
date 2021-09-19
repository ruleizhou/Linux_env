#!/bin/bash
echo "Export Variables"
export LC_ALL=C
export HTC_BUILD_STUBS_FLAG="false"
export PRIVATE_RCMS_NAME="MIRACLE6_N71"
export BCMS_SENSE_VERSION="Sense 9.0_GP"
export PRIVATE_SKU_NAME="MI6_VIVE_Global_N71_CRC_Sense90GP_Stable"
export PRIVATE_RCMS_APP="MIRACLE6_N71"
export PRIVATE_RCMS_SKU="VIVE Global"

cmd_name=(
        Only_kernel
        Modules
        ALL
)

while :
do
    echo -e "${YELOW_COLOR}cmd menu${RES}"
    for((i=0;i<${#cmd_name[@]};i++)) do
        echo -e "${YELOW_COLOR}[${i} ] ${cmd_name[i]}${RES}"
    done
    
    read -p "Select:" answer
    case ${answer} in
        0 )
            echo "============================================"
			echo "build linux kernel"
			echo "cd kernel/msm-4.4"
			echo "mkdir out"
			echo "make ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- KCFLAGS=-mno-android O=out xxx_defconfig"
			echo "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- KCFLAGS=-mno-android O=out zImage"
			echo "make -j16 ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- KCFLAGS=-mno-android O=out modules"
			echo "============================================"
            break
        ;;
        1 )
            # add env cmd
            env > env.txt; source build/envsetup.sh; lunch htc_mi6-userdebug DEBUG
            echo "============================================"
            echo "Please use command to build Modules"
            echo "============================================"
            break
        ;;
        2 )
            # add env cmd
            env > env.txt; source build/envsetup.sh; lunch htc_mi6-userdebug DEBUG
            # add build cmd
            make -j8 | tee build.log
            break
        ;;
        e|E )
            break
        ;;
        * )
            echo -e "${RED_COLOR}===Invalid input operation===${RES}"
            clear -x
            continue
        ;;
    esac   
done

