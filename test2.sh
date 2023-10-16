#!/bin/bash

echo "Select which linux family you are using"
echo "1. Arch Linux"
echo "2. Debian Linux"
echo "3. Redhat Linux"

read -p "Enter the number of your choice: " choice

case "$choice" in
	1)
		echo "You selected Arch Linux"
		echo "sudo pacman -Syyu"
		;;
	2)
		echo "You selected Debian Linux"
		echo "sudo apt get update && upgrade"
		;;
	3)
		echo "You selected Redhat Linux"
		echo "sudo dnf update"
		;;
	4)
		echo "Bye"
		exit 0
		;;
	*)
		echo "Invalid choice. PLease select a valid option."
		;;
esac
