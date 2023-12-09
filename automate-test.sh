#!/bin/bash

# If you have zsh or any other shell, you can change it above /bin/your_shell_here

# In order to use this script, you need to turn it into an executable .sh file.
# The command to do this is as follows
# chmod +x [FILE_NAME.sh]
# For example:   $ /home/$USER chmod +x run_this_script.sh
# Onced turned into an executable, You can run the script by using this method:
# ./script.sh ----> "./" allows you to run an .sh file and then from there you can let it run.
#
# In order to pre-answer yes to all of the y/n prompts, you can run the script like this:
# $ /home/$USER yes | ./script.sh
# yes | ./your_script_file.sh

# Program array, add any software you want to instal to this array, make sure to verify the official name from your package manager.-
Binaries=("vim" "nodejs" "okular" "simplescreenrecorder" "terminator" "gparted" "git" "curl" "gpg" "wget" "snapd" "gcc" "make" "mysql-server")
Arch_Binaries=("vim" "nodejs" "terminator" "gparted" "git" "curl" "gpg" "gcc" "make" "go" "discord" "neofetch")


system_setup_debian() {
	sudo apt update
	for prog in "${Binaries[@]}"; do
		if ! dpkg -l | grep -q $prog; then # --> Checks if the binary is in the package list (run command 'man dpkg' and look for the -l flag)
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

system_setup_Arch() {
    sudo pacman -Syu
    for prog in "${Arch_Binaries[@]}"; do
        if ! pacman -Q | grep -q $prog; then
            sudo pacman -S $prog
            if [$? -eq 0]; then
                echo "Installed $prog successfully"
            else
                echo "Failed to install $prog"
            fi
        else
            echo "$prog: ---> ✅ is already installed ✅"
        fi
    done
}

if ["$EUID" -ne 0]; then
	echo "Run this script with root ( ex: sudo ./<script>)."
	exit 1
fi


install_japanese() {
	echo "🇯🇵 Now installing Japanese Language 🇯🇵"
    cd /home/$USER/Downloads
    git clone https://aur.archlinux.org/ttf-koruri.git
    cd ttf-koruri
    makepkg -si
	locale-gen
}



install_Fira_Code() {
    sudo pacman -S unzip
    if [ ! -d /home/$USER/.local/share/fonts/nerd-fonts ]; then
        mkdir -p /home/$USER/.local/share/fonts/nerd-fonts
    fi
    echo "[+] Downloading Fonts [+]"
    wget -P ~/.local/share/fonts/nerd-fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
    cd /home/$USER/.local/share/fonts/nerd-fonts
    pwd
    unzip FiraCode.zip
    fc-cache -vf
    echo "[+] Confirm if FiraCode is on this list of fonts in your system [+]"
    fc-list | grep FiraCode
}


chrome_install() {
	if dpkg -l | grep -q "google-chrome"; then
		echo "Google Chrome will now install"
		
	else
		echo "Google Chrome is already installed on this system";
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo dpkg -i google-chrome-stable_current_amd64.deb
		
	fi
}

visualStudio_code_install() {
	sudo snap install --classic code
}

rust_install() {
	
if command -v &> /dev/null; then
	echo "Rust is now installing on your system"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
	echo "Rust is already installed on your system"
fi
	source $HOME/.cargo/env

}


if ! command -v dialog > /dev/null; then
	sudo apt-get install dialog || sudo pacman -S dialog
fi

dialog --menu "Please select an option:" 12 40 4 \
	1 "Debian" \
	2 "RedHat" \
	3 "Arch" \
	4 "Quit" 2> /tmp/choice

choice=$(cat /tmp/choice)
rm -f /tmp/choice

case "$choice" in
	1)	
		echo "You chose debian based linux, now installing software"
		system_setup_debian
		chrome_install
		visualStudio_code_install
		rust_install
		;;
	2)  
		echo "You chose Redhat based linux, now installing software"
		echo "Redhat stuff installing"
		;;
	3)
		echo "You chose Arch based linux, now installing software"
		system_setup_Arch
		install_Fira_Code
		install_japanese
		go version
		;;
	4)
		echo "Bye"
		exit 0;
		;;
	*)
		echo "Invalid choice. Please select a valid option"
		;;
esac







