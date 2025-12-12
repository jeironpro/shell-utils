#!/bin/bash

SISTEMA=$(uname -s)

echo -e "\U1F522 Versió?"
read VERSIO

if [ "$SISTEMA" == "Linux" ]; then
    sudo apt install openjdk-$VERSIO-jdk
elif [ "$SISTEMA" = "Fedora" ]; then
    sudo dnf install openjdk-$VERSIO-jdk
fi
