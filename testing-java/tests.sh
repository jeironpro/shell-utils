#!/bin/bash#!/bin/bash

# Codis Unicode per colors i emojis
# Emoji coet \U1F680
# Emoji correcte \u2705
# Emoji error \u274C
# Emoji pensant \U1F914
# Emoji trofeu \U1F3C6
# Color blanc i fond negre \033[40;37;1;255m \033[0m
# Color verd clar i fond negre \033[40;38;5;82m \033[0m
# Color vermell clar i fond negre \033[40;38;5;196m \033[0m

DIRECTORI_SRC_JAVA='.src/exercicis'

CLASS="$(basename "$(pwd)")"

PROGRAMA="$CLASS.java"

if [ -f "$PROGRAMA" ]; then
    cp "$PROGRAMA" "../$DIRECTORI_SRC_JAVA"
    echo -e "\U1F680 Executant les proves de \033[40;37;1;255m$PROGRAMA\033[0m"

    javac -d bin -cp src ../.src/exercicis/"$PROGRAMA" ../.src/tests/"$CLASS""Test.java"
    
    if [ $? -ne 0 ]; then
        exit 1
    fi
    
    TEST_SORTIDA=$(java -cp bin tests."$CLASS""Test")
    
    if [ -z "$TEST_SORTIDA" ]; then
        exit 1
    fi

    TEST_NUM=01
    i=1

    PASSAT_NUM=0

    FALLAT_NUM=0

    while IFS= read -r LINIA; do
        TEST_NUM=$(printf "%02d" $i)
        
        if [[ $LINIA == "Passa" ]]; then
            sleep .5
            echo -e "\u2705 \033[40;38;5;82mPASSA:\033[0m Prova \033[40;38;5;228m$TEST_NUM\033[0m superat."
            ((i++))
            ((PASSAT_NUM++))
        elif [[ $LINIA == "Falla" ]]; then
            echo -e "\u274C \033[40;38;5;196mFALLA:\033[0m Prova \033[40;38;5;288m$TEST_NUM\033[0m ha fallat."
            echo ""
            echo -e "\U1F914 Revisa el teu codi"
            ((i++))
            ((FALLAT_NUM++))
            exit 1
        fi
    done <<< "$TEST_SORTIDA"

    if [[ "$PASSAT_NUM" -gt 0 && "$FALLAT_NUM" -eq 0 ]]; then
        echo -e "\U1F3C6 Totes les proves han passat amb èxit!"
    fi
    rm -rf bin
else
    echo -e "\u274C \033[40;38;5;196mERROR:\033[0m no es troba el fitxer $CLASS"
fi
