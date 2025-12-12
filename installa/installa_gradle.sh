#!/bin/bash

GRADLE_VERSION="8.12.1"
GRADLE_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
GRADLE_DIR="$HOME/gradle"

mkdir -p $GRADLE_DIR

echo -e "\U23F3 Descarregant gradle-${GRADLE_VERSION}..."

wget -q --show-progress $GRADLE_URL -P $GRADLE_DIR

if [ $? -eq 0 ]; then 
    echo -e "\U2705 Gradle descarregat correctament en $GRADLE_DIR."
else
    echo -e "\U274C Error al descarregar Gradle."
    exit 1
fi

echo -e "\U1F4E6 Descomprimint Gradle..."

unzip -q "$GRADLE_DIR/gradle-${GRADLE_VERSION}-bin.zip" -d $GRADLE_DIR

rm "$GRADLE_DIR/gradle-${GRADLE_VERSION}-bin.zip"

echo -e "\U2699 Configurant Gradle..."

echo "export GRADLE_HOME=$GRADLE_DIR/gradle-${GRADLE_VERSION}" >> ~/.bashrc
echo "export PATH=\$GRADLE_HOME/bin:\$PATH" >> ~/.bashrc

source ~/.bashrc

gradle -v

echo -e "\U2705 gradle-${GRADLE_VERSION} instal·lat correctament."
