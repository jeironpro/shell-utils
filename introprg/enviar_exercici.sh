#!/bin/bash

EXERCICI="$(basename "$(pwd)")"
NUM_EXERCICI=$(echo "$EXERCICI" | cut -d'_' -f1-2)

git add .

git commit -am "Completat l'exercici $NUM_EXERCICI"

if ! ls *.java &> /dev/null; then
    git push
    exit 1
fi

javac *.java

PRGTEST=$(prgtest | tail -n 1)

if  [[ "$PRGTEST" == *"troba el teu següent repte"* || "$PRGTEST" == *"Aquest exercici no disposa de proves automàtiques"* ]]; then
    git push
    BLOC=${NUM_EXERCICI%%_*}
    NUM=${NUM_EXERCICI##*_}
    SEG_EXERCICI="${BLOC}_$(printf "%02d" $((10#$NUM + 1)))"
    cd ../
    prgtest init "$SEG_EXERCICI"
fi
