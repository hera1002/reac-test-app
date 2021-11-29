#!/bin/bash

sudo yum install -y yum-utils
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo yum install -y git
sudo git clone https://github.com/hera1002/reac-test-app.git
cd reac-test-app/
sudo docker build -t testapp .
sudo docker run -it -p 80:3000 testapp
