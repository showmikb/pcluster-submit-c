#!/bin/bash
#Create Mount Point if not present already
DIR="efsmount"
if [ -d "/$DIR" ]; then
  # Take action if $DIR exists. #
  echo "${DIR} Present"
  cd /$DIR
else 
  echo "Directory $DIR Not Present"
  mkdir /$DIR
  cd $DIR
fi

if grep -qs '/${DIR} ' /proc/mounts; then
    echo "It's mounted."
else
    echo "It's not mounted."
    sudo yum install -y amazon-efs-utils
    sudo mount -t efs -o tls fs-82b99d36:/ /$DIR
fi

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
