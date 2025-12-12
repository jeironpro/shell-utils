#!/bin/bash
if ls ~/.ssh/*.pub >/dev/null 2>&1; then
    echo -e "\U1F511 Ja té una o més connexió amb clau SSH."
    ls ~/.ssh/*.pub 2>/dev/null | xargs -n1 basename
	echo -e "\U1F511 Vull afegir una altra connexió?"
	read RESPOSTA
	if [[ "$RESPOSTA" == "no" || "$RESPOSTA" == "No" || "$RESPOSTA" == "NO" ]]; then
		exit 0
	fi
fi

echo -e "\U1F4E7 Introdueix el teu correu electrònic"
read CORREU_ELECTRONIC
ssh-keygen -t ed25519 -C "$CORREU_ELECTRONIC"
eval "$(ssh-agent -s)"    
ssh-add ~/.ssh/id_ed25519
ssh -T git@github.com
