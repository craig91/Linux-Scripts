
#!/bin/bash


Arch_Binaries=("vim" "nodejs" "terminator" "gparted" "git" "curl" "gpg" "gcc" "make" "go" "discord")

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
            echo "$prog is already installed"
        fi
    done
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

install_japanese() {
    cd /home/$USER/Downloads
    git clone https://aur.archlinux.org/ttf-koruri.git
    cd ttf-koruri
    makepkg -si
}

system_setup_Arch
install_Fira_Code
install_japanese
go version