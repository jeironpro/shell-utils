#!/bin/bash

DESTI=$(pwd)
inotifywait -m /tmp -e create -e moved_to --format "%f" |

while read carpeta; do
  fullpath="/tmp/$carpeta"
  if [ -d "$fullpath" ]; then
    sleep 0.4
    echo "Nueva carpeta detectada: $carpeta"
    cp -r "$fullpath" "$DESTI/"
    echo "Carpeta $carpeta copiada a $DESTI"
  fi
done
