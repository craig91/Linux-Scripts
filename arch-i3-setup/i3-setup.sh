#!/bin/bash

#Progs --> polybar neofetch feh gnome-font-viewer picom kitty chromium lxappearance nodejs brightnessctl vim gparted thunar firefox discord chromium 
# make these folders --> .config/i3/ | .config/picom/ | .config/kitty

#get from github Dot files, launch.sh

ARCH_PACKAGES = ("vim" "polybar" "neofetch" "feh" "gnome-font-viewer" "picom" "kitty" "chromium" "lxappearance" "nodejs" "brightnessctl" "gparted" "thunar" "firefox" "discord")

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

