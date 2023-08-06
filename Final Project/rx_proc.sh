#! /bin/bash

curl wttr.in/casablanca -o raw_data_$(date +%Y%m%d)
grep °C raw_data_$(date +%Y%m%d) > temperatures.txt

obs_tmp=$(cat temperatures.txt | head -1 | cut -d "+" -f2 | cut -d "(" -f1)
echo "Observed Temperature for Casablanca: $obs_tmp"

fc_tmp=$(cat temperatures.txt | head -3 | tail -1 | cut -d "+" -f3 | cut -d "(" -f2 | cut -d ")" -f1)

echo "Forcast Temperature for Casablanca in Noon: $fc_tmp"

hour=$(date +%H)
day=$(date +%d)
month=$(date +%m)
year=$(date +%Y)

echo "Current Hour: $hour, day: $day, month: $month, year: $year"
echo -e "$year\t$month\t$day\t$obs_tmp\t$fc_tmp"
echo -e "$year\t$month\t$day\t$obs_tmp\t$fc_tmp" >> rx_proc.log

