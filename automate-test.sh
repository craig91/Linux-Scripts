#!/bin/bash

Binaries=("vim", "nodejs", "okular", "simplescreenrecorder", "terminator", "gparted", "git", "curl")


system_setup_debian() {
	sudo apt update
	for prog in "${Binaries[@]}"; do
		if ! dpkg | grep -q $prog; then
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

if ["EUID" -ne 0]; then
	echo "Run this script with root ( ex: sudo ./<script>)."
	exit 1
fi

system_setup_debian
