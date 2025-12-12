#!/bin/bash

DESTI=$(pwd)

if [ -d "$DESTI" ]; then
	rm -rf "$DESTI"
fi

git clone https://github.com/gatrenat/introprg.git "$DESTI"
