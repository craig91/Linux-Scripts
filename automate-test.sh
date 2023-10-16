#!/bin/bash

Binaries=("vim" "nodejs" "okular" "simplescreenrecorder" "terminator" "gparted" "git" "curl" "gpg" "wget" "snapd")


system_setup_debian() {
	sudo apt update
	for prog in "${Binaries[@]}"; do
		if ! dpkg -l | grep -q $prog; then
			sudo apt install -y $prog
			if [ $? -eq 0 ]; then
				echo "Installed $prog successfully"
			else
				echo "Failed to install $prog"
			fi
		else
			echo "$prog is already installed"
		fi
	done
}

if ["$EUID" -ne 0]; then
	echo "Run this script with root ( ex: sudo ./<script>)."
	exit 1
fi



chrome_install() {
	wget -P https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
}



visualStudio_code_install() {
	sudo snap install --classic code
}


system_setup_debian
chrome_install
visualStudio_code_install