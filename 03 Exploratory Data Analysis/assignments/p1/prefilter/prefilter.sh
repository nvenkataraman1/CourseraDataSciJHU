#!/bin/sh

# for matching 1/2/2007
awk -F";" '{OFS=","; ORS="\n"} {if($1=="1/2/2007") print $1,$2,$3,$4,$5,$6,$7,$8,$9}' household_power_consumption.txt > 01.txt

# for matching 2/2/2007
awk -F";" '{OFS=","; ORS="\n"} {if($1=="2/2/2007") print $1,$2,$3,$4,$5,$6,$7,$8,$9}' household_power_consumption.txt > 02.txt

# for concatenating files into data for use
cat heading.txt 01.txt 02.txt > ../data/filtereddata.csv
