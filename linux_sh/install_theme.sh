#!/bin/bash

if [ -d $HOME/.themes/Mojave-dark ]; then
    echo "theme already install"
else
	echo "install theme"
	sudo apt -y install gtk2-engines-murrine gtk2-engines-pixbuf
	sudo apt -y install sassc optipng inkscape libcanberra-gtk-module libglib2.0-dev libxml2-utils
	sudo apt-get install -f
	git clone https://github.com/vinceliuice/Mojave-gtk-theme.git
	git clone https://github.com/vinceliuice/McMojave-circle.git
	cd Mojave-gtk-theme
	./install.sh
	cd ../McMojave-circle
	./install.sh
	cd ..
	rm  Mojave-gtk-theme McMojave-circle -rf
fi
