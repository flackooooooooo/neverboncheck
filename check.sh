#!/bin/bash
# NeverBounce Email Valid Checker
# Coded by flacka
# flacka

RED='\033[0;31m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
GREEN='\e[32m'
NC='\033[0m'

nvb(){
check=$(curl -s https://api.neverbounce.com/v4/single/check?key=secret_389881952b2316840f4492003b6c7bfb --data-urlencode "email=$1" | grep -Po '(?<="result":")[^"]*');

if [[ $check == "valid" ]]; then
printf "${PURPLE}[$wkt]${ORANGE}[$c/$tot]${GREEN} $1\n${NC}";
                echo $1 >> nvb.tmp
                else
printf "${PURPLE}[$wkt]${ORANGE}[$c/$tot]${RED} $1\n${NC}";                             
        fi
        
}

figlet -f small "NeverBounce"
echo "Email Checker By flacka"
echo
echo "Total Check : `wc -l $1`"
echo
inc=1
for mail in $(cat $1); do
c=$((inc++))
tot=$(cat $1 | wc -l)
wkt=$(date '+%H:%M:%S')
    nvb $mail
done
sort nvb.tmp | uniq -u >> nvb-live.txt
echo "Checking Done !"
echo "LIVE : `wc -l nvb-live.txt`"
