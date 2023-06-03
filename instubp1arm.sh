#!/bin/bash

apt update

###################################
#### Install updated Ubuntu Version
###################################

apt upgrade -y 
apt install plocate sntp ntpdate software-properties-common -y 
hostnamectl set-hostname $2


apt update 
#passwd root
echo "root:$1" | chpasswd   # set root password -


##############################
#### Install Virtualmin
##############################

wget -O virtualmin-install_arm.sh https://raw.githubusercontent.com/fdmgit/install-ubuntu-22.04/main/virtualmin-install_arm.sh
sh virtualmin-install_arm.sh -y
reboot
