#!/bin/bash
_now=$(date +"%Y-%m-%d_%H.%M.%S")
apt-get update
apt-get install htop gcc g++ make subversion
mv /boot/config.txt /boot/config.txt_$_now.bak
cp config.txt /boot/config.txt
mv /etc/rc.local /etc/rc.local_$_now.bak
cp rc.local /etc/rc.local
chmod 755 /etc/rc.local
mv /home/xbian/.xbmc/userdata/advancedsettings.xml /home/xbian/.xbmc/userdata/advancedsettings.xml_$_now.bak
cp advancedsettings.xml /home/xbian/.xbmc/userdata/advancedsettings.xml
mv /home/xbian/boboptions.txt /home/xbian/boboptions.txt_$_now.bak
cp boboptions.txt /home/xbian/boboptions.txt
cd /home/xbian/
svn checkout http://boblight.googlecode.com/svn/trunk/ /home/xbianboblight_source
cd /home/xbian/boblight_source/
./configure --without-portaudio --without-x11 --without-libusb
make; sudo make install
ldconfig
cd /home/xbian/
rm -rf boblight-dispmanx
wget https://github.com/brooc/boblight-rpi/raw/master/src/boblight-dispmanx
chmod 755 boblight-dispmanx
rm -rf /home/xbian/setup_raspi02