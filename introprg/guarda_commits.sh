#!/bin/bash

DESTI=$(pwd)

git log --all --pretty=format:"%H %s" > commits.txt
mv commits.txt "$DESTI"
