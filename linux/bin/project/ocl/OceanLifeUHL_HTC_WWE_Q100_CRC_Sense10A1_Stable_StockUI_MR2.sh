#!/bin/bash
echo "Export Variables"
export LC_ALL=C
export HTC_BUILD_STUBS_FLAG="false"
export PRIVATE_RCMS_NAME="OCEAN_LIFE_UHL_Q100_SENSE10A1_MR"
export BCMS_SENSE_VERSION="Sense 10.0_GP"
export PRIVATE_SKU_NAME="OceanLifeUHL_HTC_WWE_Q100_CRC_Sense10A1_Stable_StockUI_MR2"
export PRIVATE_RCMS_APP="OCEAN_LIFE_UHL_Q100_SENSE10A1_MR"
export PRIVATE_RCMS_SKU="HTC Europe"

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
            env > env.txt; rm -rf external/HtcBuildFlag/a1_app; rm -rf packages/apps/GMS_Base/; wget http://cc.htc.com/CC3Output/003/058/390/sie.zip; source build/envsetup.sh; lunch htc_ocluhl-userdebug
            echo "============================================"
            echo "Please use command to build Modules"
            echo "============================================"
            break
        ;;
        2 )
            # add env cmd
            env > env.txt; rm -rf external/HtcBuildFlag/a1_app; rm -rf packages/apps/GMS_Base/; wget http://cc.htc.com/CC3Output/003/058/390/sie.zip; source build/envsetup.sh; lunch htc_ocluhl-userdebug
            # add build cmd
            make WITHOUT_CHECK_API=true SKIP_BOOT_JARS_CHECK=true -j16 | tee build.log
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

