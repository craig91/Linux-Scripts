#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install zsh
zsh-version
whereis zsh
sudo usermod -s /usr/bin/zsh $(whoami)
echo "Reboot your computer and run 2nd part of this script, once rebooted, select option 2 on zsh new user config when opening a new terminal"

