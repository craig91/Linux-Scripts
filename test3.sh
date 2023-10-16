#!/bin/bash

if ! command -v dialog > /dev/null; then
	sudo apt-get install dialog
fi

dialog --menu "Please select an option:" 12 40 4 \
	1 "Option A" \
	2 "Option B" \
	3 "Option C" \
	4 "Quit" 2> /tmp/choice

choice=$(cat /tmp/choice)

rm -f /tmp/choice

case "$choice" in
    1)
        echo "You selected Option A."
        # Add code to execute for Option A
        ;;
    2)
        echo "You selected Option B."
        # Add code to execute for Option B
        ;;
    3)
        echo "You selected Option C."
        # Add code to execute for Option C
        ;;
    4)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Please select a valid option."
        ;;
esac

