#!/bin/bash
#Create Mount Point if not present already
DIR="efsmount"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "${DIR} Present"
  cd $DIR
else 
  echo "Directory $DIR Not Present"
  mkdir $DIR
  cd $DIR
fi
sudo mount -t efs -o tls fs-45dddf94:/ $DIR
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
