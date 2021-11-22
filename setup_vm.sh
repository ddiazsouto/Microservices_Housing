#!/bin/bash
# Installing Docker and docker compose
sudo apt-get update

echo "----fetching Docker----"
sudo apt-get update
sudo apt install curl -y
curl https://get.docker.com | sudo bash

echo "----Installing Docker-compose------"
# make sure jq & curl is installed
sudo apt update
sudo apt install -y curl jq
# set which version to download (latest)
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
# download to /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# make the file executable
sudo chmod +x /usr/local/bin/docker-compose


# Now Ansible

mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
## install pip3
sudo apt install python3-pip -y
## install ansible with pip3
pip3 install --user ansible
# check that ansible has been installed
ansible --version

sudo apt update 

# And terraform

 sudo apt-get install -y unzip wget
 wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
 unzip terraform_*_linux_*.zip
 sudo mv terraform /usr/local/bin
 rm terraform_*_linux_*.zip
 terraform --version

# Azure CLi 
 curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash