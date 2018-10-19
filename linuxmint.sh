#!/bin/bash
echo Enter User name, used for this PC:
read user
dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y
add-apt-repository ppa:remmina-ppa-team/remmina-next -y
apt update
#apt upgrade -y
apt install mc htop remmina remmina-plugin-rdp -y
apt install --install-recommends winehq-stable -y
su $user -c "wget -P /home/$user/ https://www.microsip.org/download/MicroSIP-Lite-3.18.5.exe"
