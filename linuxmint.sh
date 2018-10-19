#!/bin/bash
echo "Enter User name, used for this PC:"
read user
echo "##############"
echo "#Adding Repos#"
echo "##############"
dpkg --add-architecture i386
su $user -c "wget -P /home/$user/ https://dl.winehq.org/wine-builds/Release.key && apt-key add /home/$user/Release.key"
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y
add-apt-repository ppa:remmina-ppa-team/remmina-next -y
apt update
echo "#################"
echo "#Installing Wine#"
echo "#################"
apt install --install-recommends winehq-stable -y
echo "############################"
echo "#Installing MC,Htop,Remmina#"
echo "############################"
apt install mc htop remmina remmina-plugin-rdp -y
echo "###############################################"
echo "#Downloading Microsip in /home/$user directory#"
echo "###############################################"
su $user -c "wget -P /home/$user/ https://www.microsip.org/download/MicroSIP-Lite-3.18.5.exe"
