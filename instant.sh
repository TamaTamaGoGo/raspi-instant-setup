#!/bin/bash

function start(){
    wget -qO- https://raw.githubusercontent.com/TamaTamaGoGo/raspi-instant-setup/main/$1 | bash
}

mkdir raspi-instant-setup
cd raspi-instant-setup

rm -rf colortest.sh
rm -rf apt.sh
rm -rf installlist.txt

start colortest.sh
start apt.sh
