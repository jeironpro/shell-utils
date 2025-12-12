#!/bin/bash

DIRECTORI_ACTUAL=$(basename "$(pwd)")

DIRECTORI_REPOSITORI="exercicis"

SCRIPT=$(basename "$0")

DIRECTORIS=("Calculadora" "Semafor" "Duplica")

if [[ "$DIRECTORI_ACTUAL" == "$DIRECTORI_REPOSITORI" ]]; then
    if [[ "$SCRIPT" == ".exercicis.sh" && "$1" == "init" && -n "$2" ]]; then
        if [[ "${DIRECTORIS[@]}" =~ "$2" ]]; then
            echo -e "\U1F4C2 Creant el directori $2..."
            mkdir "$2"
            echo -e "\u2705 S'ha creat el directori $2."
            
            echo -e "\U1F4CB Instruccions per a l'exercici"
            echo -e "   \U1F4C1 cd $2"
        else
            echo -e "\u274C \033[40;38;5;196mERROR:\033[0m El directori no és de un exercici"
        fi
    else
        echo -e "\u274C ERROR: Sintaxis incorrecta. Uso correcto \033[40;38;5;228m'test init Directori'\033[0m"
    fi
fi
