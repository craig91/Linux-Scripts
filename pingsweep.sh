#!/bin/bash

if [ "$1" == "" ]
then
echo "You did not put an IP address"
echo "Syntax: ./pingsweep <enter an IP address until the 3rd octet.> ex: 192.168.1"

else
for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done 
fi