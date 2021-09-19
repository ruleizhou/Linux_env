#!/bin/bash

temp_path=$USER
if [ -d $work_path/htc ]; then
    temp_path=htc
elif [ -d $work_path/$USER ]; then
    temp_path=$USER
else
    echo "/home/work/htc or $USER not exists"
    exit 1
fi

if [ `grep -c "${USER}_setupCHRE" $linux_env/config/bash_aliases` -ne 0 ]; then
    echo "Already import common aliases "
else
    echo "Import command to bash_aliases"
    echo "alias temp='cd \$work_path/$temp_path/temp'" >> $linux_env/config/bash_aliases
    echo "alias issue='cd \$work_path/$temp_path/issue'" >> $linux_env/config/bash_aliases
    echo "alias rom='cd \$work_path/$temp_path/rom'" >> $linux_env/config/bash_aliases
    echo "alias share='cd \$work_path/$temp_path/share'" >> $linux_env/config/bash_aliases
    echo "alias commit='cd ~/$USER/commit'" >> $linux_env/config/bash_aliases
    echo "alias work='cd \$work_path'" >> $linux_env/config/bash_aliases
    echo "alias cts='cd \$linux_env/android/cts'" >> $linux_env/config/bash_aliases
    echo "alias gts='cd \$linux_env/android/gts'" >> $linux_env/config/bash_aliases
    echo "alias vts='cd \$linux_env/android/vts'" >> $linux_env/config/bash_aliases
    echo "alias ${USER}_build='. \$work_path/$USER/Linux_env/linux/bin/build_set.sh'" >> $linux_env/config/bash_aliases

    echo "alias ${USER}_kernel_log='python $linux_env/linux/bin/kernel_log_converter/kernel_qualcomm.py'" >> $linux_env/config/bash_aliases
    echo "alias ${USER}_cp_releas_key='cp $work_path/work/$USER/release_key/* ./build/target/product/security/'" >> $linux_env/config/bash_aliases
    echo "alias ${USER}_setupCHRE='export PATH=$linux_env/linux/tool/gcc/gcc-arm-none-eabi-5_2-2015q4/bin/:${PATH}; export CROSS_COMPILE=arm-none-eabi-'" >> $linux_env/config/bash_aliases
	. ~/.bashrc
fi

