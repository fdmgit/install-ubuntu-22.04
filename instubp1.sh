#!/bin/bash

# Installation script mainly for Virtualmin

apt update

###################################
#### Install updated Ubuntu Version
###################################

apt upgrade -y 
apt install plocate sntp ntpdate software-properties-common -y 
hostnamectl set-hostname $2

cd /root

apt update 
#passwd root
echo "root:$1" | chpasswd   # set root password -

####################################
#### Install gat (alternative to cat
####################################

cd /usr/local/bin
wget https://github.com/koki-develop/gat/releases/download/v0.8.3/gat_Linux_x86_64.tar.gz
tar -xvzf gat_Linux_x86_64.tar.gz
chown root:root gat
chmod +x gat
rm gat_Linux_x86_64.tar.gz
rm LICENSE
rm README.md

###################################
#### Add joshuto (cli filemanager)
###################################

cd /usr/local/bin
wget https://github.com/kamiyaa/joshuto/releases/download/v0.9.4/joshuto-v0.9.4-x86_64-unknown-linux-gnu.tar.gz
tar -xvzf joshuto-v0.9.4-x86_64-unknown-linux-gnu.tar.gz
chown root:root joshuto
chmod +x joshuto
rm joshuto-v0.9.4-x86_64-unknown-linux-gnu.tar.gz


###################################
#### Build aliases file
###################################

cd /root
mkdir .bash_aliases
echo "alias jos='joshuto'" >> .bash_aliases
echo "alias gc='gat'" >> .bash_aliases


##############################
#### Install Virtualmin
##############################

wget -O virtualmin-install.sh https://raw.githubusercontent.com/virtualmin/virtualmin-install/master/virtualmin-install.sh
sh virtualmin-install.sh -y
rm virtualmin-install.sh
reboot
