#!/bin/bash



function getSrcIP() {
    local pcap_file=$1
    tcpdump -tttt -r $pcap_file -n tcp | cut -d " " -f 4 | cut -d "." -f 1-4 | sort | uniq -c | sort -nr | while read line; do
        echo "Source IP: $line"
    done
}

function getDstIP() {
    local pcap_file=$1
    tcpdump -tttt -r $pcap_file -n tcp | cut -d " " -f 6 | cut -d "." -f 1-4 | sort | uniq -c | sort -nr | while read line; do
        echo "Destination IP: $line"
    done
}

OPTFLAGS=":s:d:"

while getopts "$OPTFLAGS" flag; do
    case "$flag" in
        s)
            getSrcIP "$OPTARG"
            ;;
        d)
            getDstIP "$OPTARG"
            ;;
        :)  
            echo "Option -${OPTARG} requires a pcap file as an argument."
            exit 1
            ;;
        ?)  
            echo "Invalid option: -${OPTARG}."
            exit 1
            ;;
        esac
done
        



