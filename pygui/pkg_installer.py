import os
import distro
import tkinter as tk
from tkinter import messagebox, scrolledtext

Binaries = ["vim-common", "nodejs", "okular", "terminator", "gparted", "git-core", "curl", "gnupg2", "wget2", "snapd", "gcc", "make", "neofetch", "Thunar"]
Snaps = ["discord", "ghidra", "simplescreenrecorder"]

Linux_distro = distro.id()

def get_linux_distro():
    return f"Your linux distro is: {Linux_distro} Linux"

def install_dnf_packages():
    package_list_dnf = os.popen("dnf list installed | awk '{print $1}' | cut -d. -f1").read().split()
    results = []
    for prog in Binaries:
        if prog in package_list_dnf:
            results.append(f"{prog} is installed")
        else:
            results.append(f"{prog} is not installed. Installing.....")
            os.system(f"sudo dnf install -y {prog}")
    return "\n".join(results)

def install_apt_packages():
    package_list_apt = os.popen("dpkg -l| egrep -i '[A-Z][a-z]' | awk '{print $2}' | cut -d. -f1 ").read().split()
    results = []
    for prog in Binaries:
        if prog in package_list_apt:
            results.append(f"{prog} is installed")
        else:
            results.append(f"{prog} is not installed. Installing.....")
            os.system(f"sudo apt install -y {prog}")
    return "\n".join(results)

def install_pacman_packages():
    package_list_pacman = os.popen("pacman -Qqe").read().split()
    results = []
    for prog in Binaries:
        if prog in package_list_pacman:
            results.append(f"{prog} is installed")
        else:
            results.append(f"{prog} is not installed. Installing.....")
            os.system(f"sudo pacman -S install -y {prog}")
    return "\n".join(results)

def install_snap_packages():
    snap_list = os.popen("snap list | awk '{print $1}' ").read().split()
    results = []
    for binary in Snaps:
        if binary in snap_list:
            results.append(f"{binary} This snap package is installed")
        else:
            results.append(f"{binary} This snap package is not installed. Installing.....")
            os.system(f"sudo snap install {binary}")
    return "\n".join(results)

def run_installation():
    if Linux_distro == "fedora":
        result = get_linux_distro() + "\nInstalling RedHat binaries.....\n" + install_dnf_packages()
    elif Linux_distro == "ubuntu":
        result = get_linux_distro() + "\nInstalling Debian binaries.....\n" + install_apt_packages()
    elif Linux_distro == "arch":
        result = get_linux_distro() + "\nInstalling Arch binaries.....\n" + install_pacman_packages()
    else:
        result = "You must be running some uncommon linux distro"
    result += "\n\n" + install_snap_packages()
    return result

def on_run_button_click():
    result = run_installation()
    result_text.config(state=tk.NORMAL)
    result_text.delete(1.0, tk.END)
    result_text.insert(tk.END, result)
    result_text.config(state=tk.DISABLED)

# Create the main window
root = tk.Tk()
root.title("Linux Package Installer")
root.geometry("600x400")

# Create and place the frames
top_frame = tk.Frame(root)
top_frame.pack(pady=10)

middle_frame = tk.Frame(root)
middle_frame.pack(pady=10)

bottom_frame = tk.Frame(root)
bottom_frame.pack(pady=10)

# Create and place the labels
distro_label = tk.Label(top_frame, text=f"Detected Linux Distro: {Linux_distro}", font=("Helvetica", 12))
distro_label.pack(pady=5)

instruction_label = tk.Label(top_frame, text="Click the button below to start the installation process.", font=("Helvetica", 10))
instruction_label.pack(pady=5)

# Create and place the button
run_button = tk.Button(middle_frame, text="Run Installation", command=on_run_button_click, font=("Helvetica", 12), bg="blue", fg="white")
run_button.pack(pady=10)

# Create and place the scrolled text area
result_text = scrolledtext.ScrolledText(bottom_frame, wrap=tk.WORD, width=70, height=15, font=("Helvetica", 10))
result_text.pack(pady=10)
result_text.config(state=tk.DISABLED)

# Start the main event loop
root.mainloop()
