#!/bin/bash
export  PATH='/sbin:/bin:/usr/sbin:/usr/bin:~/.local/bin/'
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

if rpm -qa autoconf
then
    echo "Proceeding as required installations are present"
else
    yum install autoconf
    yum install automake
fi

aclocal
autoconf
automake --add-missing
./configure
make distcheck
aws s3 cp fibonacci-0.1.tar.gz s3://pcluster-submit-c-artifact/fibonacci-0.1.tar.gz


echo "DOWNLOADFROM S3"
aws secretsmanager --region us-east-1 get-secret-value --secret-id divine-showmik.pem --query 'SecretString' --output text > divine-showmik.pem
chmod 600 divine-showmik.pem
pcluster  ssh bosecluster -r us-east-1 -i divine-showmik.pem 'bash -s' < main.sh


#sudo yum install git -y

