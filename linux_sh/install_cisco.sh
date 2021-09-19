#!/bin/bash
#connet     vpncn.htc.com
#name       name@xxx.com
#Password   xxxx 
if [ -d /opt/cisco ]; then
    echo "cisco already install"
else
    echo "install cisco"
    sudo apt-get install  libpangox-1.0-0 --fix-missing -y
    git clone https://github.com/ruleizhou/tools.git
    cd tools/cisco
    sudo ./vpn_install.sh
    cd -
    rm tools -rf
fi

if [ -f ~/.local/share/applications/anyconnect.desktop ]; then
    echo "anyconnect.desktop already exists"
else
    ## create desktop ##
    touch ~/.local/share/applications/anyconnect.desktop
    echo "[Desktop Entry]" >> ~/.local/share/applications/anyconnect.desktop
    echo "Type=Application" >> ~/.local/share/applications/anyconnect.desktop
    echo "Name=Cisco AnyConnect VPN Client" >> ~/.local/share/applications/anyconnect.desktop
    echo "Icon=/opt/cisco/vpn/pixmaps/vpnui48.png" >> ~/.local/share/applications/anyconnect.desktop
    echo "Exec=/opt/cisco/vpn/bin/vpnui" >> ~/.local/share/applications/anyconnect.desktop
    echo "Terminal=false" >> ~/.local/share/applications/anyconnect.desktop
    echo "Encoding=UTF-8" >> ~/.local/share/applications/anyconnect.desktop
    echo "Categories=Application;Network;" >> ~/.local/share/applications/anyconnect.desktop
fi

