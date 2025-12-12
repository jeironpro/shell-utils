#!/bin/bash

DIR_INSTALLACIO="$HOME/.local/bin"
mkdir -p "$DIR_INSTALLACIO"
DIR_GH="$HOME/.local/gh-cli"
mkdir -p "$DIR_GH"

SISTEMA=$(uname -s)

if [[ "$SISTEMA" != "Linux" ]]; then
    echo -e "\U1F427 Aquest script nomes funciona en Linux."
    exit 1
fi

URL_GH=$(curl -s https://api.github.com/repos/cli/cli/releases/latest | grep "browser_download_url" | grep "linux_amd64.tar.gz" | cut -d '"' -f 4)

if [[ -z "$URL_GH" ]]; then
    echo -e "\u274C \033[40;38;5;196mERROR:\033[0m No es pot obtenir la URL de descàrrega de GitHub CLI."
    exit 1
fi

echo -e "\U1F419 Descarregant GitHub CLI..."
curl -L -o "$DIR_GH/gh.tar.gz" "$URL_GH"

if ! tar -tzf "$DIR_GH/gh.tar.gz" &>/dev/null; then
    echo -e "\u274C \033[40;38;5;196mERROR:\033[0m L'arxiu descarregat no es un tar.gz vàlid."
    exit 1
fi
 
tar -xzf "$DIR_GH/gh.tar.gz" -C "$DIR_GH"
mv "$DIR_GH"/gh_*/bin/gh "$DIR_INSTALLACIO/"

if [[ ":$PATH:" != *":$DIR_INSTALLACIO:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    export PATH="$HOME/.local/bin:$PATH"
    source ~/.bashrc
fi

if command -v gh &>/dev/null; then
    gh --version
    echo -e "\U1F419 GitHub CLI instalat correctament en $DIR_INSTALLACIO"
else 
    echo -e "\u274C \033[40;38;5;196mERROR:\033[0m en la instal·lació"
fi
