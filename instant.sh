#!/bin/bash

function start(){
    wget -qO- https://raw.githubusercontent.com/TamaTamaGoGo/raspi-instant-setup/main/$1 | bash
}

start apt.sh