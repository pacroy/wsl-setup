#!/bin/bash
set -e

# Update system
sudo apt-get update
sudo apt-get upgrade

# Create symbolic links
cd ~
ln -s /mnt/c/Users/pacroy/ pacroy
ln -s /mnt/c/Users/pacroy/OneDrive/dev dev
ln -s /mnt/c/Users/pacroy/OneDrive/dev/go go

# Install SSH key
mkdir ~/.ssh
cp ~/pacroy/OneDrive/.ssh/id_rsa ~/.ssh
cp ~/pacroy/OneDrive/.ssh/id_rsa.pub ~/.ssh
chmod 600 ~/.ssh/id_rsa

# Install Node.js 11
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Golang 1.11.4
cd ~/pacroy/Downloads
curl -O https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz
sudo tar -xvzf go1.11.4.linux-amd64.tar.gz -C /usr/local
echo 'GOPATH=$HOME/go' >> ~/.profile
echo 'PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.profile
source ~/.profile