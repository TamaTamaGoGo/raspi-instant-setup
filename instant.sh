#!/bin/bash

function start(){
    wget -qO- https://raw.githubusercontent.com/TamaTamaGoGo/raspi-instant-setup/main/$1 | bash
}

echo 'To prevent berryboot's issue, we change swap to off'
sudo systemctl disable dphys-swapfile

mkdir raspi-instant-setup
cd raspi-instant-setup

rm -rf colortest.sh
rm -rf apt.sh
rm -rf installlist.txt

start colortest.sh
start apt.sh

echo 'If you not using berryboot and you want to run swap, please run'
echo 'sudo systemctl enable dphys-swapfile && sudo systemctl start dphys-swapfile'
