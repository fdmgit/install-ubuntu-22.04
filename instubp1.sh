#!/bin/bash

apt update

###################################
#### Install updated Ubuntu Version
###################################

apt upgrade -y 
apt install plocate sntp ntpdate software-properties-common -y 
hostnamectl set-hostname $2

####################################
#### Install gat (alternative to cat
####################################

cd /usr/local/bin
wget https://raw.githubusercontent.com/fdmgit/install-ubuntu-22.04/main/gat_Linux_x86_64.tar.gz
tar -xvzf gat_Linux_x86_64.tar.gz
chown root:root gat
chmod +x gat
rm gat_Linux_x86_64.tar.gz
rm LICENSE
rm README.md

cd /root

apt update 
#passwd root
echo "root:$1" | chpasswd   # set root password -


##############################
#### Install Virtualmin
##############################

wget -O virtualmin-install.sh https://raw.githubusercontent.com/virtualmin/virtualmin-install/master/virtualmin-install.sh
sh virtualmin-install.sh -y
rm virtualmin-install.sh
reboot
