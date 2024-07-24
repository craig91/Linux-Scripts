import os
import distro
# import subprocess


Binaries = ["vim-common","nodejs","okular","terminator","gparted","git-core","curl","gnupg2","wget2","snapd","gcc","make", "neofetch", "thunar"]
Snaps = ["discord", "ghidra", "simplescreenrecorder"]


package_list_dnf = os.popen("dnf list installed | awk '{print $1}' | cut -d. -f1").read().split()
package_list_apt = os.popen("dpk -l | awk 'print $2' | cut -d. -f1").read.split()
package_list_pacman = os.popen("pacman -Qqe").read.split()
snap_list = os.popen("snap list | awk '{print $1}' ").read().split()


Linux_distro = distro.id()



def GetLinuxDistro():
     print("Your linux distro is:", Linux_distro, "Linux")



   

def installDnfPackages():
    for prog in Binaries:
        if prog in package_list_dnf:
            print(f"{prog} is installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo dnf install -y {prog}")


def installAptPackages():
    for prog in Binaries:
        if prog in package_list_apt:
            print(f"{prog} is installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo apt install -y {prog}")

def installPacmanPackages():
    for prog in Binaries:
        if prog in package_list_pacman:
            print(f"{prog} is installed")
        else:  
            print(f"{prog} is not installed. Installing.....")
            os.system(f"sudo Pacman -S install -y {prog}")


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
    print("installing Debian binaries")
    installAptPackages()
elif Linux_distro == "arch":
    GetLinuxDistro()
    print("installing Arch binaries")
    installPacmanPackages()
else:
    print("You must be running some uncommon linux distro ")





# def installDebianPackages():
#     subprocess.run(["sudo", "apt", "install", "-y", prog], check=True)


# def installArchPackages():
#     subprocess.run(["sudo", "pacman", "-S", prog], check=True)




