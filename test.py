import os
import distro
import subprocess


Binaries = ["vim-common","nodejs","okular","terminator","gparted","git-core","curl","gnupg2","wget2","snapd","gcc","make","neofetch","kitty","zsh"]
Snaps = ["discord", "ghidra", "simplescreenrecorder"]





snap_list = os.popen("snap list | awk '{print $1}' ").read().split()


Linux_distro = distro.id()
def GetLinuxDistro():
     print("Your linux distro is:", Linux_distro, "Linux")                                                      



            
def installChromeDebian():
    try:
        subprocess.run(['sudo', 'apt', 'install', '-y', 'wget'], check=True)
        downloads_folder = os.path.join(os.path.expanduser('~'), 'Downloads')
        subprocess.run(['wget', 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb', '-P', downloads_folder], check=True)
        chrome_file = os.path.join(downloads_folder, 'google-chrome-stable_current_amd64.deb')
        subprocess.run(['sudo', 'apt', 'install', '-y', chrome_file], check=True)
        subprocess.run(['rm', 'chrome_file'], check=True)
        print("Google Chrome has been installed")
    except subprocess.CalledProcessError as e:
        print(f"An error occured: {e}")        
   

def installChromeRedhat():
    try:
        subprocess.run(['sudo', 'dnf', 'install', '-y', 'wget'], check=True)
        downloads_folder = os.path.join(os.path.expanduser('~'), 'Downloads')
        subprocess.run(['wget', 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.rpm', '-P', downloads_folder], check=True)
        chrome_file = os.path.join(downloads_folder, 'google-chrome-stable_current_amd64.deb')
        subprocess.run(['sudo', 'dnf', 'install', '-y', chrome_file], check=True)
        subprocess.run(['rm', 'chrome_file'], check=True)
        print("Google Chrome has been installed")
    except subprocess.CalledProcessError as e:
        print(f"An error occured: {e}")        





def installDnfPackages():
    package_list_dnf = os.popen("dnf list installed | awk '{print $1}' | cut -d. -f1").read().split()    
    for prog in Binaries:
        if prog in package_list_dnf:
            print(f"{prog} is already installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo dnf install -y {prog}")


def installAptPackages():
    package_list_apt = os.popen("dpkg -l| egrep -i '[A-Z][a-z]' | awk '{print $2}' | cut -d. -f1 ").read().split()
    for prog in Binaries:
        if prog in package_list_apt:
            print(f"{prog} is already installed")   
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo apt install -y {prog}")

def installPacmanPackages():
    package_list_pacman = os.popen("pacman -Qqe").read().split()
    for prog in Binaries:
        if prog in package_list_pacman:
            print(f"{prog} is already installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo Pacman -S install -y {prog}")


def installSnapPackages():
    snap_list = os.popen("snap list | awk '{print $1}' ").read().split()
    for binary in Snaps:
        if binary in snap_list:
            print(f"{binary} This snap package is already installed")
        else:
            print(f"{binary} This snap package is not installed, Now Installing")
            os.system(f"sudo snap install {binary}")




## Install fonts ##



if Linux_distro == "fedora":
    GetLinuxDistro()
    print(f"Installing {Linux_distro} binaries.....")
    print("Installing snaps....")
    installSnapPackages()
    print("########## " " INSTALLING BINARIES " " ##############")
    installChromeRedhat()
    installDnfPackages()
elif Linux_distro == "ubuntu" or "debian" :
    GetLinuxDistro()
    print(f"Installing {Linux_distro} binaries.....")
    print("Installing snaps....")
    installSnapPackages()
    print("########## " " INSTALLING BINARIES " " ##############")
    installChromeDebian()
    installAptPackages()
elif Linux_distro == "arch":
    GetLinuxDistro()
    print(f"Installing {Linux_distro} binaries.....")
    print("Installing snaps....")
    installSnapPackages()
    print("########## " " INSTALLING BINARIES " " ##############")
    installPacmanPackages()
else:
    print("You must be running some uncommon linux distro ")






