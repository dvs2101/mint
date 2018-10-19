#!/bin/bash
dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y
add-apt-repository ppa:remmina-ppa-team/remmina-next -y
apt update
apt upgrade -y
apt install mc htop remmina remmina-plugin-rdp -y
apt install --install-recommends winehq-stable -y
wget https://www.microsip.org/download/MicroSIP-Lite-3.18.5.exe
