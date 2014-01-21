#!/bin/bash
_now=$(date +"%Y-%m-%d_%H.%M.%S")
sudo apt-get update
mv /boot/config.txt /boot/config.txt_$_now.bak
cp config.txt /boot/config.txt
mv /etc/rc.local /etc/rc.local_$_now.bak
cp rc.local /etc/rc.local
chmod 755 /etc/rc.local
cd /home/xbian/
wget https://github.com/brooc/boblight-rpi/raw/master/src/boblight-dispmanx
chmod 755 boblight-dispmanx