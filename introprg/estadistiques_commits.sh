#!/bin/bash

REPORTE="reporte_commits.csv"
ESTADISTIQUES="estadistiques_commits.csv"

if [[ -f "$ESTADISTIQUES" ]]; then
	rm "$ESTADISTIQUES"
fi

head -n 1 "$REPORTE" > "$ESTADISTIQUES"

tail -n +2 "$REPORTE" | sort -t',' -k2 -nr >> "$ESTADISTIQUES"

COMMITS=$(tail -n +2 "$REPORTE" | awk -F',' '{print $2}')

MAXIM=$(echo "$COMMITS" | sort -nr | head -n1)

MINIM=$(echo "$COMMITS" | sort -n | head -n1)

SUMA=$(echo "$COMMITS" | paste -sd+ - | bc)
QUANTITAT=$(echo "$COMMITS" | wc -l)
MITJANA=$(awk "BEGIN { print int( ($SUMA / $QUANTITAT) + 0.5 ) }")

echo "Estadistiques,Commits" >> "$ESTADISTIQUES"
echo "Màxim commits,$MAXIM" >> "$ESTADISTIQUES"
echo "Mìnim commits,$MINIM" >> "$ESTADISTIQUES"
echo "Mitjana commits,$MITJANA" >> "$ESTADISTIQUES"

echo "Reporte ordenat guardat en $ESTADISTIQUES"
