#!/bin/bash

# VERSION=1.6
# This script outputs: time;http-latency;icmp
# 

echo 'hour;epoch-time;http-dolphin;http-iew-dolphin;http-sew-dolphin;http-google;ping-dolphin;ping-gateway~';

while true
do
	date +"%H%M" | tr -d '\n' ; echo -n ';' ;
	date +"%s" | tr -d '\n' ; echo -n ';' ; 
        curl -L --output /dev/null --silent --write-out '%{time_namelookup}' https://dolphin.amazon.com  ; 
        echo -n ';' ; 
        curl -L --output /dev/null --silent --write-out '%{time_namelookup}' https://na.iew.dolphinprod.last-mile.amazon.dev  ; 
        echo -n ';' ; 
        curl -L --output /dev/null --silent --write-out '%{time_namelookup}' https://na.sew.dolphinprod.last-mile.amazon.dev  ; 
        echo -n ';' ; 
        curl -L --output /dev/null --silent --write-out '%{time_namelookup}' https://www.google.com  ; 
        echo -n ';' ; 
        ping -n 5 -l 1000 -w 1 na.iew.dolphinprod.last-mile.amazon.dev | grep Average | sed -r 's/.*Average = // ; s/ms//' | tr -d '\n' ;
        echo -n ';';
	ping -n 5 -l 1000 -w 1 10.9.32.1 | grep Average | sed -r 's/.*Average = // ; s/ms//' | tr -d '\n' ;
        echo -n '~';
        echo ;

done



