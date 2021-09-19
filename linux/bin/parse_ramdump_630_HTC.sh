#!/bin/bash

RAM_DUMP_PATH=""
#TOOL_PATH="/home/dennis_zhang/disk2/issue/QCOM_RAMDUMP/linux-ramdump-parser-v2"
#TOOL_PATH="/home/dennis_zhang/disk2/issue/QCOM/RamdumpParser_SDM630_v2_2017_05_09/RamdumpParser_SDM630_v2_2017_05_09/linux-ramdump-parser-v2"
TOOL_PATH="/home/han/.software/linux-ramdump-parser-v2"
#debug flag
DEBUG=1

#this part is per chipset configuration arguments, each chipset may contains different setting
CHIPSET=""
PHYS_OFFSET=""

function show_help_message()
{
	echo
	echo "==== HELP INFO ===="
	echo "Usage: ./parse_ramdump_HTC.sh -chip <TARGET_CHIPSET> -path <RAMDUMP_PATH>"
	echo
        echo "For example: ./parse_ramdump_HTC.sh -chip 8998 -path ./ramdump_8998"
	echo
	echo "For more detail, please refer to the \"README\"."
}


echo "start ram dump parse tool v2"

while [ "$1" != "" ]; do
	case $1 in
		-path)
			echo PATH detected
			RAM_DUMP_PATH=$2
		;;
		-chip)
			CHIPSET=$2
		;;
		-help)
			show_help_message
			exit 0
		;;
	esac
	shift 1
done

if [ "$RAM_DUMP_PATH" == "" ] || [ "$CHIPSET" == "" ]; then
	echo "Please enter right input format or use \"-help\" for help message"
	exit 1
fi

#setting up per chipset configurations
case $CHIPSET in
	8916)
	;;
	8960)
		PHYS_OFFSET="--phys-offset 0x80400000"
	;;
	8930_early)
		PHYS_OFFSET="--phys-offset 0x80400000"
	;;
	8930)
		PHYS_OFFSET="--phys-offset 0x80600000"
	;;
	8064)
		PHYS_OFFSET="--phys-offset 0x80600000"
	;;
	8974)
	;;
	8x26)
	;;
	8996)
		PHYS_OFFSET="--phys-offset 0x80000000"
	;;
	8998)
		PHYS_OFFSET="--phys-offset 0xffffff8008000000"
	;;
	630)
		PHYS_OFFSET="--phys-offset 0xffffff8008000000"
	;;
	*)
		echo "Target chipset \"$CHIPSET\" is not supported!!"
		exit 1
	;;
esac

# for debugging
if [ "$DEBUG" == "1" ]; then
	echo "######## VARIALBLES ########"
	echo "RAM_DUMP_PATH : $RAM_DUMP_PATH"
	echo "TOOL_PATH : $TOOL_PATH"
	echo "CHIPSET : $CHIPSET"
	echo "PHYS_OFFSET : $PHYS_OFFSET"
fi

OUT=$RAM_DUMP_PATH/out
mkdir $OUT

echo "Parsing DDR start ..."
python $TOOL_PATH/ramparse.py -a $RAM_DUMP_PATH -v $RAM_DUMP_PATH/vmlinux -o $OUT --nm-path $TOOL_PATH/aarch64-linux-android-nm --gdb-path $TOOL_PATH/aarch64-linux-android-gdb --everything --page-offset 0xffffff8008000000 --force-hardware 630
