#!/bin/bash
if [ -d $linux_env/linux/tool/motrix ]; then
    echo "motrix already install"
else
    echo "install motrix"
	mkdir $linux_env/linux/tool/motrix -p
	wget https://dl.motrix.app/release/Motrix-1.4.1-x86_64.AppImage -P  $linux_env/linux/tool/motrix
	chmod +x $linux_env/linux/tool/motrix/Motrix-1.4.1-x86_64.AppImage
fi
if [ ! -d ~/.local/share/applications ]; then
	mkdir -p ~/.local/share/applications
fi
if [ -f ~/.local/share/applications/appimagekit-motrix.desktop ]; then
	echo "appimagekit-motrix.desktop alreay exist"
else
	touch ~/.local/share/applications/appimagekit-motrix.desktop
    echo "[Desktop Entry]" >> ~/.local/share/applications/appimagekit-motrix.desktop
    echo "Name=Motrix" >> ~/.local/share/applications/appimagekit-motrix.desktop
    echo "Exec=$linux_env/linux/tool/motrix/Motrix-1.4.1-x86_64.AppImage %U" >> ~/.local/share/applications/appimagekit-motrix.desktop
    echo "Icon=appimagekit-motrix" >> ~/.local/share/applications/appimagekit-motrix.desktop
    echo "Type=Application" >> ~/.local/share/applications/appimagekit-motrix.desktop
    echo "Comment=A full-featured download manager" >> ~/.local/share/applications/appimagekit-motrix.desktop
    echo "Categories=Network;" >> ~/.local/share/applications/appimagekit-motrix.desktop
fi