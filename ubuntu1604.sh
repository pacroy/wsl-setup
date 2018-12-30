#!/bin/bash
set -e

# Update system
sudo apt-get update
sudo apt-get upgrade -y

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
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Golang 1.11.4
# https://tecadmin.net/install-go-on-ubuntu/
cd ~/pacroy/Downloads
curl -O https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz
sudo tar -xvzf go1.11.4.linux-amd64.tar.gz -C /usr/local
echo 'GOPATH=$HOME/go' >> ~/.profile
echo 'PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.profile
source ~/.profile
cd ~

# Install Azure CLI
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
sudo apt-get install apt-transport-https lsb-release software-properties-common -y
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
     --keyserver packages.microsoft.com \
     --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
sudo apt-get update
sudo apt-get install azure-cli
sudo az aks install-cli

# Configure Git
git config --global user.email "pacroy@gmail.com"
git config --global user.name "Par"
git config --global push.default simple