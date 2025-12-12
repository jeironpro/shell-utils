#!/bin/bash

# Directorio imagenes
IMAGENES_DIR="$HOME/fondo_escritorio"

# Lista de rutas de las imagenes en la carpeta personal
IMAGENES=("$IMAGENES_DIR"/*.jpg)

# Tiempo de espera en segundos
INTERVALO=300

# Bucle para cambiar las imagenes cada cierto tiempo
while true; do
	# Seleccion aleatoria de una imagen
	NUMEROS=$((RANDOM % ${#IMAGENES[@]}))
	IMAGEN_SELECCIONADA="${IMAGENES[$NUMEROS]}"
	
	# Cambiar fondo de escritorio
	gsettings set org.gnome.desktop.background picture-uri "file://${IMAGEN_SELECCIONADA}"
	
	# Esperar antes de cambiar de nuevo
	sleep $INTERVALO
done
