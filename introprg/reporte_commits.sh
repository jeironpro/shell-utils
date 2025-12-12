#!/bin/bash

REPORTE="reporte_commits.csv"

if [[ ! -f "$REPORTE" ]]; then
	echo "Exercici,Commits" > "$REPORTE"
fi

while true; do
	read -p "Introdueix el nombre de l'exercici: " EXERCICI
	
	if [[ "$EXERCICI" == "surt" ]]; then
		break;
	fi
	
	COMPTADOR=$(grep -F "prgtest actualitzat resultat per $EXERCICI" commits.txt | wc -l) 
	echo "$EXERCICI,$COMPTADOR" >> "$REPORTE"
	
	echo "Exercici: $EXERCICI guardat amb $COMPTADOR commits."
done

echo -e "\U1F4C4 Reporte guardat en $REPORTE"
