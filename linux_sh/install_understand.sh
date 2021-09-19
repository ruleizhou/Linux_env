#!/bin/bash
. ~/.bashrc
if [ -d $linux_env/linux/tool/scitools ]; then
    echo "config understand"
    if [ ! -d ~/.local/share/applications ]; then
    	mkdir -p ~/.local/share/applications
    fi
    if [ -f ~/.local/share/applications/understand.desktop ]; then
    	rm ~/.local/share/applications/understand.desktop -rf
    fi
    touch ~/.local/share/applications/understand.desktop
    echo "[Desktop Entry]" >> ~/.local/share/applications/understand.desktop
    echo "Name=Understand" >> ~/.local/share/applications/understand.desktop
    echo "Exec=$linux_env/linux/tool/scitools/bin/linux64/understand" >> ~/.local/share/applications/understand.desktop
    echo "Icon=$linux_env/linux/tool/scitools/bin/linux64/understand_64.png" >> ~/.local/share/applications/understand.desktop
    echo "Type=Application" >> ~/.local/share/applications/understand.desktop
    echo "Terminal=false" >> ~/.local/share/applications/understand.desktop
    echo "Comment=Analyze it, measure it, visualize it, maintain it - Understand it" >> ~/.local/share/applications/understand.desktop
    echo "GenericName=Static analysis tool" >> ~/.local/share/applications/understand.desktop
    echo "Categories=Development;IDE;" >> ~/.local/share/applications/understand.desktop
else
    echo "scitools not exist. Please download scitools"
fi
