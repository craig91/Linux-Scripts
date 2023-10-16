#!/bin/bash

# If you have zsh or any other shell, you can change it above /bin/your_shell_here

# In order to use this script, you need to turn it into an executable .sh file.
# The command to do this is as follows
# chmod +x [FILE_NAME.sh]
# For example:   $ /home/mecc01 chmod +x run_this_script.sh
# Onced turned into an executable, You can run the script by using this method:
# ./script.sh ----> "./" allows you to run an .sh file and then from there you can let it run.
#
# In order to pre-answer yes to all of the y/n prompts, you can run the script like this:
# $ /home/mecc01 yes | ./script.sh
# yes | ./your_script_file.sh





# Program array, add any software you want to instal to this array, make sure to verify the official name from your package manager.-
Binaries=("vim" "nodejs" "okular" "simplescreenrecorder" "terminator" "gparted" "git" "curl" "gpg" "wget" "snapd")


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

if ["$EUID" -ne 0]; then
	echo "Run this script with root ( ex: sudo ./<script>)."
	exit 1
fi



chrome_install() {
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
}



visualStudio_code_install() {
	sudo snap install --classic code
}


system_setup_debian
chrome_install
visualStudio_code_install