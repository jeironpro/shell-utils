#!/bin/bash

echo -e "\U1F4C1 Escriu el nombre del bloc i rang de directoris. Ex: 10 1 10"
read -a num_bloc_dir

if [[ ${#num_bloc_dir[@]} -lt 3 || ${#num_bloc_dir[@]} -gt 3 ]]; then
    echo -e "\u274C \033[40;38;5;196mError:\033[0m Has d'introduir el nombre del bloc y rang de directoris."
    exit 1
fi

if [[ ${num_bloc_dir[0]} =~ ^[0-9]+$ && ${num_bloc_dir[1]} =~ ^[0-9]+$ && ${num_bloc_dir[2]} =~ ^[0-9]+$ ]]; then
    mkdir Bloc${num_bloc_dir[0]}
    cd Bloc${num_bloc_dir[0]}

    comptador=${num_bloc_dir[1]}

    while [ $comptador -le ${num_bloc_dir[2]} ]; do
        if [ $comptador -lt 10 ]; then
            mkdir ${num_bloc_dir[0]}"_0"$comptador
            ((comptador++))
        else 
            mkdir ${num_bloc_dir[0]}"_"$comptador
            ((comptador++))
        fi
    done
    echo -e "\u2705 S'han creat tots els directoris."
else
    echo -e "\u274C \033[40;38;5;196mError:\033[0m Has d'introduir tres nombres."
fi
