#!/bin/bash

function inst(){
  echo -en '\e[1;37;49mInstalling $1...\e[0m'
  echo -e '\e[2;37;49m'
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
echo -e '\e[2;37;49m'
sudo apt update -y
echo -e '\e[1;37;49mUpdated\e[0m'
echo
echo -en '\e[1;37;49mUpgrading...\e[0m'
echo -e '\e[2;37;49m'
sudo apt upgrade -y
echo -e '\e[1;37;49mUpgraded\e[0m'

for file in $(ls installlist.txt)
do
  inst $file
done
