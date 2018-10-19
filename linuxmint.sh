#!/bin/bash
echo -e "\033[1;33mEnter User name, used for this PC:\033[0m"
read user
echo -e "##############"
echo -e "#\033[1;31mAdding Repos\033[0m#"
echo -e "##############"
dpkg --add-architecture i386
su $user -c "wget -P /home/$user/ https://dl.winehq.org/wine-builds/Release.key && apt-key add /home/$user/Release.key"
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y
add-apt-repository ppa:remmina-ppa-team/remmina-next -y
apt update
echo -e "#################"
echo -e "#\033[1;31mInstalling Wine\033[0m#"
echo -e "#################"
apt install --install-recommends winehq-stable -y
echo -e "############################"
echo -e "#\033[1;31mInstalling MC,Htop,Remmina\033[0m#"
echo -e "############################"
apt install mc htop remmina remmina-plugin-rdp -y
echo -e "###############################################"
echo -e "#\033[1;31mDownloading Microsip in /home/$user directory\033[0m#"
echo -e "###############################################"
su $user -c "wget -P /home/$user/ https://www.microsip.org/download/MicroSIP-Lite-3.18.5.exe"
