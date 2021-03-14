#!/bin/bash

echo ""
echo "BEGIN EXECUTION OF PRIVILEGED PART..."

user=user

adduser $user
usermod -aG sudo $user

# renew package list
apt-get update

### install docker
# update the apt package index and install packages to allow apt to use a repository over HTTPS
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# use the following command to set up the stable repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# renew package list
apt-get update

# install
apt-get install docker-ce docker-ce-cli containerd.io

# Add to docker group to run docker from user
usermod -aG docker $user


### docker - установка ч.2 - docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


echo "FINISHED EXECUTION OF PRIVILEGED PART."
echo ""
