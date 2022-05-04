# download from bcs.ca net and save to Desktop

# VERSION=1.5
# CLIP_TAG="howdeepartner" #dont use the a,b,c,d at the end

# example to convert Epoch to human readable date: 
# cat ~/Desktop/monitorA.csv  | sed -r 's/,,/,0,/g' | cut -d ',' -f 2-9  | sed -r 's/^([0-9]+),(.*)/date --date="@\1" +"%Y-%m-%d %H:%M:%S" | tr -d "\\n"; echo ", \2"~/'  |  tail -9 | sh

CLIP_TAG=$1

echo ;
echo ;
echo ;
echo '# ########################################################';
echo '# Description: downloads from bcs.ca net and save to Desktop' ; 
echo '# ';
echo '# ########################################################';
echo ;
echo ;
echo 'Downloading files from bcs.ca';

echo "downloading ${CLIP_TAG}a";
curl --silent -L "https://bcs.ca/${CLIP_TAG}a" | tr -d '\n' | sed -r 's=.*placeholder==' | grep epoch-time | cut -d '>' -f 2 | cut -d '<' -f 1 | tr '~' '\n' | tr ';' ',' > ~/Desktop/monitorA.csv

echo "downloading ${CLIP_TAG}b";
curl --silent -L "https://bcs.ca/${CLIP_TAG}b" | tr -d '\n' | sed -r 's=.*placeholder==' | grep epoch-time | cut -d '>' -f 2 | cut -d '<' -f 1 | tr '~' '\n' | tr ';' ',' > ~/Desktop/monitorB.csv

echo "downloading ${CLIP_TAG}c";
curl --silent -L "https://bcs.ca/${CLIP_TAG}c" | tr -d '\n' | sed -r 's=.*placeholder==' | grep epoch-time | cut -d '>' -f 2 | cut -d '<' -f 1 | tr '~' '\n' | tr ';' ',' > ~/Desktop/monitorC.csv

echo "downloading ${CLIP_TAG}d";
curl --silent -L "https://bcs.ca/${CLIP_TAG}d" | tr -d '\n' | sed -r 's=.*placeholder==' | grep epoch-time | cut -d '>' -f 2 | cut -d '<' -f 1 | tr '~' '\n' | tr ';' ',' > ~/Desktop/monitorD.csv

echo 'Saving CSV files to desktop';


