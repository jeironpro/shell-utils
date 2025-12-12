#!/bin/bash

# Nom d'usuari GitHub
USUARI_GH=""

STATUS=$(gh auth status)

while IFS= read -r LINIA; do
    if [[ $LINIA == "github.com" ]]; then
        echo -e "\U1F511 Ja està loguejat en GitHub"
        break
    else
        gh auth login 
        break
    fi  
done <<< "$STATUS"

echo -e "\U2B1C Vull crear o eliminar un repositori?"
read ACCIO

echo -e "\U1F516 Introdueix el nom del repositori"
read REPOSITORI

if [[ $ACCIO == "eliminar" ]]; then
    gh auth refresh -h github.com -s delete_repo
    gh repo delete $REPOSITORI --yes
    exit 1
fi

if [[ $ACCIO == "crear" ]]; then
    gh repo create "$REPOSITORI" --public
    git config --global init.defaultBranch main

    mkdir "$REPOSITORI"
    cd "$REPOSITORI" || exit

    git init
    echo "# $REPOSITORI" > README.md

    git add .

    git commit -am "Primer commit"

    git branch -M main

    git remote add origin "https://github-personal/$USUARI_GH/$REPOSITORI.git"

    git push -u origin main

    echo -e "\U1F30D ¡Repositori $REPOSITORI creat i pujat a GitHub."
fi

echo -e "\U1F91D Vull afegir algú col·laborator?"
read RESPOSTA

if [[ $RESPOSTA == "si" ]]; then
    echo -e "\U270D Introdueix l'usuari del col·laborator"
    read COLLABORATOR
    gh api \
      --method PUT \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      /repos/"$USUARI_GH"/"$REPOSITORI"/collaborators/"$COLLABORATOR"
fi
