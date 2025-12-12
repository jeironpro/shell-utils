#!/bin/bash

URL="https://www.apachefriends.org"

ULTIMA_VERSION=$(curl -s "$URL" | grep -oP 'https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/\d+.\d+.\d+/xampp-linux-x64-\d+.\d+.\d+-\d+-installer.run')

NOM_EXECUTABLE="xampp_latest.run"

if [[ -z "$ULTIMA_VERSION" ]]; then
    echo -e "No es pot obtenir una url de descàrrega vàlid."
    exit 1
fi

echo -e "\U1F4E5 Descarregant XAMP"

wget -O "$NOM_EXECUTABLE" "$ULTIMA_VERSION"

chmod +x "$NOM_EXECUTABLE"

sudo ./"$NOM_EXECUTABLE"

rm "$NOM_EXECUTABLE"
