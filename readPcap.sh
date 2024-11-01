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
    tcpdump -tttt -r $pcap_file -n tcp 2>&1 | cut -d " " -f 6 | cut -d "." -f 1-4 | sort | uniq -c | sort -nr | while read count ip; do
        printf "%-20s %-10d\n" "$ip" "$count"
    done
}

function getSrcPort() {
    local pcap_file=$1
    printf "%-20s %-10s\n" "Source Port" "Count" 
    printf "%-20s %-10s\n" "-----------" "-----"
    tcpdump -tttt -r $pcap_file -n tcp 2>&1 | cut -d " " -f 4 | cut -d "." -f 5 | sort | uniq -c | sort -nr | while read Count ports; do
        printf "%-20s %-10d\n" "$ports" "$Count"
    done
}

function getDstPort() {
    local pcap_file=$1
    printf "%-20s %-10s\n" "Destination Port" "Count" 
    printf "%-20s %-10s\n" "----------------" "-----"
    tcpdump -tttt -r $pcap_file -n tcp 2>&1 | cut -d " " -f 6 | cut -d "." -f 5 | sort | uniq -c | sort -nr | while read Count ports; do
        printf "%-20s %-10d\n" "$ports" "$Count"
    done
}

OPTFLAGS=":s:d:r:p:"

while getopts "$OPTFLAGS" flag; do
    case "$flag" in
        s)
            getSrcIP "$OPTARG"
            ;;
        d)
            getDstIP "$OPTARG"
            ;;
        r)
            getSrcPort "$OPTARG"
            ;;
        p)
            getDstPort "$OPTARG"
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
        



