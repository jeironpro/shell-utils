#!bin/bash

# Función para obtener el nombre de la distribución Linux
obtener_nombre_distribucion() {
    if [ -r /etc/os-release ]; then
        . /etc/os-release
        echo "$NAME"
    elif command -v lsb_release >/dev/null 2>&1; then
        lsb_release -si
    elif [ -f /etc/issue ]; then
        head -n 1 /etc/issue | awk '{print $1}'
    else
        echo "Desconocida"
    fi
}

nombre_distribucion=$(obtener_nombre_distribucion)

if [ "$nombre_distribucion" == "Ubuntu" ]; then
    sudo apt update
    sudo apt install zsh -y

    chsh -s $(which zsh)

    echo $SHELL # /usr/bin/zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    mv oh-my-zsh ~/.oh-my-zsh

    echo $ZSH # /home/usuario/.oh-my-zsh
else if [ "$nombre_distribucion" == "Fedora" ]; then
    sudo dnf install zsh -y
    zsh
    chsh -s $(which zsh)
else
    echo "Distribución sin método de instalación disponible"
fi