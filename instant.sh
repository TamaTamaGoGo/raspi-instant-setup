#!/bin/bash

function start(){
    wget -qO- https://raw.githubusercontent.com/TamaTamaGoGo/raspi-instant-setup/main/$1 | bash
}

echo 'To prevent berryboots issue, we change swap to off'
sudo systemctl disable dphys-swapfile

mkdir raspi-instant-setup
cd raspi-instant-setup

rm -rf colortest.sh
rm -rf apt.sh
rm -rf installlist.txt

start colortest.sh
start apt.sh

wget https://cli-assets.heroku.com/branches/stable/heroku-linux-arm.tar.gz
mkdir -p /usr/local/lib /usr/local/bin
sudo tar -xvzf heroku-linux-arm.tar.gz -C /usr/local/lib
sudo ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku
heroku -v
rm -rf heroku-linux-arm.tar.gz

sudo npm install -g nodemon
sudo npm install -g forever

echo 'If you not using berryboot and you want to run swap, please run'
echo 'sudo systemctl enable dphys-swapfile'
