#!/bin/bash



function getSrcIP() {
    local pcap_file=$1
    printf "%-20s %-10s\n" "Source IP" "Count"
    printf "%-20s %-10s\n" "---------" "-----"
    tcpdump -tttt -r $pcap_file -n tcp 2>&1 | cut -d " " -f 4 | cut -d "." -f 1-4 | sort | uniq -c | sort -nr | while read count ip; do
        printf "%-20s %-10d\n" "$ip" "$count"
    done
}

function getDstIP() {
    local pcap_file=$1
    printf "%-20s %-10s\n" "Destination IP" "Count"
    printf "%-20s %-10s\n" "--------------" "-----"
    tcpdump -tttt -r $pcap_file -n tcp 2>&1 | cut -d " " -f 6 | cut -d "." -f 1-4 | sort | uniq -c | sort -nr | while read line; do
        printf "%-20s %-10d\n" "$ip" "$count"
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
        



