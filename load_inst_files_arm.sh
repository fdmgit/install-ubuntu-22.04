#!/bin/bash

wget https://raw.githubusercontent.com/fdmgit/install-ubuntu-22.04/main/bashrc.ini
wget https://raw.githubusercontent.com/fdmgit/install-ubuntu-22.04/main/instubp1arm.sh
wget https://raw.githubusercontent.com/fdmgit/install-ubuntu-22.04/main/instubp2arm.sh

cp bashrc.ini /root/.bashrc
rm /root/bashrc.ini

chmod +x /root/instubp1arm.sh
chmod +x /root/instubp2arm.sh

###################################
#### Setup root key file
###################################

if [ -d /root/.ssh ]; then 
    echo ".ssh exists"
else
    mkdir /root/.ssh
fi

if [ -f /root/.ssh/authorized_keys ]; then
    echo "file authorized_keys exists"
else
    cd /root/.ssh
    wget https://raw.githubusercontent.com/fdmgit/virtualmin/main/authorized_keys
fi

reboot
