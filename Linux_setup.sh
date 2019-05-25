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

#############################
# sudo apt install snapd
sudo apt install curl
sudo apt update
sudo apt upgrade
#############################
# Software installations


# sudo apt install emacs
# sudo apt install steam
sudo apt install kazam
sudo apt install simplescreenrecorder
sudo apt install git
sudo apt install vim
# wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/
# sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
sudo snap install signal-desktop
# curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
# sudo sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com `lsb_release -sc` main" >> /etc/apt/sources.list.d/brave.list'
sudo apt update
# sudo apt install brave-browser brave-keyring
 #sudo apt-get install pdfshuffler
sudo snap install spotify
sudo snap install whatsdesk
# sudo apt-get install dictd
# sudo apt-get install dict-gcide
# sudo apt-get install dict-moby-thesaurus
# sudo apt-get install thunderbird
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install okular
sudo snap install slack --classic
git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
sudo apt update
sudo apt upgrade


