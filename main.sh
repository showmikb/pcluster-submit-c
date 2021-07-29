#!/bin/bash
#Append your authentication token if it is a private repo : git clone https://token@github.com/showmikb/pcluster-submit-jobs.git
DIR="pcluster-submit-c"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "${DIR} Present"
  cd $DIR
  git pull https://github.com/showmikb/$DIR.git

else 
  echo "Directory $DIR Not Present"
  git clone https://github.com/showmikb/$DIR.git
  cd $DIR
fi


echo "Submitting Jobs"
qsub sampleshell.sh
