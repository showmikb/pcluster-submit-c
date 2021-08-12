#!/bin/bash
#Append your authentication token if it is a private repo : git clone https://token@github.com/showmikb/pcluster-submit-jobs.git
# DIR="pcluster-submit-c"
# if [ -d "$DIR" ]; then
#   # Take action if $DIR exists. #
#   echo "${DIR} Present"
#   cd $DIR
#   git pull https://github.com/showmikb/$DIR.git

# else 
#   echo "Directory $DIR Not Present"
#   git clone https://github.com/showmikb/$DIR.git
#   cd $DIR
# fi

# if rpm -qa autoconf
# then
#     echo "Proceeding as required installations are present"
# else
#     yum install autoconf
#     yum install automake
# fi

# aclocal
# autoconf
# automake --add-missing
# ./configure
# make distcheck

aws s3 cp s3://pcluster-submit-c-artifact/fibonacci-0.1.tar.gz .


echo "Submitting Jobs"
qsub sampleshell.sh
# qsub fibonacci-0.1.tar.gz
