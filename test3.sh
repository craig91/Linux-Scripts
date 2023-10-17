#!/bin/bash

if ! command -v dialog > /dev/null; then
	if sudo apt-get install dialog == [$? - 0]; then
        
    else sudo dnf install dialog
        echo "not redhat based, moving on to arch linux based"
    fi 
    
fi

dialog --menu "Please select an option:" 12 40 4 \
	1 "curl" \
	2 "vim" \
	3 "nano" \
	4 "Quit" 2> /tmp/choice

choice=$(cat /tmp/choice)

rm -f /tmp/choice

case "$choice" in
    1)
        echo "You selected Option A."
            sudo dnf install curl
        ;;
    2)
        echo "You selected Option B."
            sudo dnf install vim
        ;;
    3)
        echo "You selected Option C."
            sudo dnf install nano
        ;;
    4)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Please select a valid option."
        ;;
esac

