import os
import distro
# import subprocess


Binaries = ["vim-common","nodejs","okular","terminator","gparted","git-core","curl","gnupg2","wget2","snapd","gcc","make", "neofetch", "Thunar"]
Snaps = ["discord", "ghidra", "simplescreenrecorder"]





snap_list = os.popen("snap list | awk '{print $1}' ").read().split()


Linux_distro = distro.id()
def GetLinuxDistro():
     print("Your linux distro is:", Linux_distro, "Linux")

            

   

def installDnfPackages():
    package_list_dnf = os.popen("dnf list installed | awk '{print $1}' | cut -d. -f1").read().split()
    results = []        
    for prog in Binaries:
        if prog in package_list_dnf:
            results.append(f"{prog} is already installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo dnf install -y {prog}")
    return "\n".join(results)


def installAptPackages():
    package_list_apt = os.popen("dpkg -l| egrep -i '[A-Z][a-z]' | awk '{print $2}' | cut -d. -f1 ").read().split()
    results = []
    for prog in Binaries:
        if prog in package_list_apt:
            results.append(f"{prog} is already installed")   
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo apt install -y {prog}")
    return "\n".join(results)

def installPacmanPackages():
    package_list_pacman = os.popen("pacman -Qqe").read().split()
    results = []
    for prog in Binaries:
        if prog in package_list_pacman:
            results.append(f"{prog} is already installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo Pacman -S install -y {prog}")
    return "\n".join(results)


def installSnapPackages():
    for binary in snap_list:
        if binary in snap_list:
            print(f"{binary} This snap package is installed")
        else:
            print(f"{binary} This snap package is not installed")



if Linux_distro == "fedora":
    GetLinuxDistro()
    print("Installing RedHat binaries.....")
    installDnfPackages()
elif Linux_distro == "ubuntu":
    GetLinuxDistro()
    print("Installing Debian binaries")
    installAptPackages()
elif Linux_distro == "arch":
    GetLinuxDistro()
    print("Installing Arch binaries")
    installPacmanPackages()
else:
    print("You must be running some uncommon linux distro ")






