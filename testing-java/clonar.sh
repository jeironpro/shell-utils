#!/bin/bash

TOKEN=""
USUARI_GH=""
DIRECTORI_ACTUAL=$(pwd)

CARPETA_REPOSITORI="exercicis"

if [ -d "$CARPETA_REPOSITORI" ]; then
    echo -e "\U1F4A1 El repositori ja existeix."
    exit 1
else
    echo -e "\U1F419 Clonant el repositori..."
    git clone https://$TOKEN@github.com/$USUARI_GH/exercicis.git
fi

cp -r "$DIRECTORI_ACTUAL/src" "$CARPETA_REPOSITORI/.src"  
cp "$DIRECTORI_ACTUAL/tests.sh" "$CARPETA_REPOSITORI/.tests.sh"  
cp "$DIRECTORI_ACTUAL/exercicis.sh" "$CARPETA_REPOSITORI/.exercicis.sh"  

cd "$CARPETA_REPOSITORI"
git add .
git commit -am "Afegint support"
git push
