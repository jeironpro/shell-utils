#!/bin/bash

JUNIT_VERSION="5.12.0"
LIBS_DIR="junit/libs"

mkdir -p $LIBS_DIR
JUNIT_URL="https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter/${JUNIT_VERSION}/junit-jupiter-${JUNIT_VERSION}.jar"

echo -e "\U23F3 Descarregant JUnit..."

wget -q --show-progress -P $LIBS_DIR $JUNIT_URL

if [ $? -eq 0 ]; then 
    echo -e "\U2705 JUnit descarregat correctament en $LIBS_DIR."
else
    echo -e "\U274C Error al descarregar JUnit."
fi
