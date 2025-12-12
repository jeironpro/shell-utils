#!/bin/bash

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb

sudo dpkg -i vscode.deb

sudo apt --fix-broken install

export PATH=$PATH:$HOME/vscode/usr/bin
source ~/.bashrc

rm vscode.deb
