#!/bin/bash

# version: 1.5
# This script uploads monitor.txt to bcs.ca
# 
echo ;
echo ;
echo '# ###########################################';
echo '# Description: This script uploads monitor.txt to bcs.ca';
echo '#';
echo '# example:';
echo '# sh uploader.sh "uqzjoimfwjlxq"';
echo '# ###########################################';
echo '';
echo '';
echo '';

# CLIP_TAG='uqzjoimfwjlxq'
CLIP_TAG=$1

while true
do
	echo "getting the last 1000000bytes from monitor.txt"
	head -n 1 monitor.txt > monitor1m.txt ; tail -c 999000 monitor.txt >> monitor1m.txt

	echo "uploading file to https://bcs.ca/${CLIP_TAG}";
	curl -L --data-urlencode 'myPaste@monitor1m.txt' https://bcs.ca/${CLIP_TAG}

	echo "upload completed";
        echo ;

	echo "waiting 60sec before uploading to bcs.ca";
	sleep 60;

done


