#!/bin/bash
echo  "\033[1;33m>>Enter User name, used for this PC<<\033[0m"
read user
if [ -d "/home/$user" ]
then
		echo "Check user - $user succesfully!"
else
		echo "User $user not exist. Break..."
		exit
fi

echo  "##############"
echo  "#\033[1;31mAdding Repos\033[0m#"
echo  "##############"
dpkg --add-architecture i386
su $user -c "wget -P /home/$user/ https://dl.winehq.org/wine-builds/Release.key"
apt-key add /home/$user/Release.key
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' -y
add-apt-repository ppa:remmina-ppa-team/remmina-next -y
apt update

echo  "#################"
echo  "#\033[1;31mInstalling Wine\033[0m#"
echo  "#################"

apt install --install-recommends winehq-stable -y
echo  "############################"
echo  "#\033[1;31mInstalling MC,Htop,Remmina\033[0m#"
echo  "############################"

apt install mc htop remmina remmina-plugin-rdp -y
echo  "###############################################"
echo  "#\033[1;31mDownloading Microsip in /home/$user directory\033[0m#"
echo  "###############################################"

su $user -c "wget -P /home/$user/ https://www.microsip.org/download/MicroSIP-Lite-3.18.5.exe"
echo  "#######################################################################"
echo  "##############################\033[1;31mAlmost done\033[0m##############################"
echo  "#\033[1;31mPlease follow further instructions for configuring Wine and MicroSIP!\033[0m#"
echo  "#######################################################################"

su $user -c "winecfg && wine /home/$user/MicroSIP-Lite-3.18.5.exe"
echo  "###############################################"
echo  "#\033[1;31mWineconfig & MicroSIP installed!\033[0m#"
echo  "###############################################"

