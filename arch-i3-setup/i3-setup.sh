#!/bin/bash

#Progs --> polybar neofetch feh gnome-font-viewer picom kitty chromium lxappearance nodejs brightnessctl vim gparted thunar firefox discord chromium 
# make these folders --> .config/i3/ | .config/picom/ | .config/kitty

#get from github Dot files, launch.sh

ARCH_PACKAGES = ("vim" "polybar" "neofetch" "feh" "gnome-font-viewer" "picom" "kitty" "chromium" "lxappearance" "nodejs" "brightnessctl" "gparted" "thunar" "firefox" "discord" "unzip" "bumblebee-status")
BINARY_LIST = com -23 <(pacman -Qqe | sort) <(expac -l '\n' '$E' base | sort) | grep $prog

setupArch() {
    sudo pacman -Syu
    for prog in "${ARCH_PACKAGES[@]}"; do
        if ! com -23 <(pacman -Qqe | sort) <(expac -l '\n' '$E' base | sort) | grep $prog; then
            sudo pacman -S $prog
            if [$? -eq 0]; then
                echo "Installed $prog successfully"
            else
                echo "Failed to install $prog"
        else
            echo "$prog is already installed"
        fi
    done 
}

install_Fira_Code() {
    if [ ! -d /$HOME/.local/share/fonts/nerd-fonts ]; then
        mkdir -p /$HOME/.local/share/fonts/nerd-fonts
    fi
    echo "[+] Downloading Fonts [+]"
    wget -P ~/.local/share/fonts/nerd-fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
    cd /$HOME/.local/share/fonts/nerd-fonts
    pwd
    unzip FiraCode.zip
    echo "[+] Confirm if FiraCode is on this list of fonts in your system [+]"
    fc-list | grep FiraCode
}

Bumblebee_status() {
    if [bumblebee-status -eq ${BINARY_LIST}; then
        git clone https://aur.archlinux.org/bumblebee-status.git
        cd bumblebee-status
        makepkg -sicr 

    
}

