#!/bin/bash

function inst(){
  echo -en '\e[1;37;49mInstalling $1...\e[0m'
  echo -e '\e[0;37;49m'
  sudo apt -y install $1
  echo -e '\e[1;37;49mInstalled $1\e[0m'
  echo -en '\e[1;37;49mChecking command $1...\e[0m'
  echo -e '\e[2;37;49m'
  if [ -v $(which $1) ]; then
    echo "You can use $1"
  else
    echo "You can't use $1"
  fi
  echo
}

echo -en '\e[1;37;49mUpdating...\e[0m'
echo -e '\e[0;30;49m'
sudo apt update -y
echo -e '\e[1;37;49mUpdated\e[0m'
echo
echo -en '\e[1;37;49mUpgrading...\e[0m'
echo -e '\e[2;37;49m'
sudo apt upgrade -y
echo -e '\e[1;37;49mUpgraded\e[0m'

wget https://raw.githubusercontent.com/TamaTamaGoGo/raspi-instant-setup/master/installist.txt

for file in $(cat ./installist.txt)
do
  inst $file
done

rm -rf installist.txt

echo -en '\e[1;37;49mInstalling Pi-Apps...\e[0m'
echo -e '\e[2;37;49m'
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash
echo -e '\e[1;37;49mInstalled\e[0m'

echo -en '\e[1;37;49mInstalling Node.js...\e[0m'
echo -e '\e[2;37;49m'
curl -L https://git.io/v7kPb | bash
echo -e '\e[1;37;49mInstalled\e[0m'

echo 'Finished!'
