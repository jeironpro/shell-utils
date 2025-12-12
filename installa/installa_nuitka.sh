# Script para instalar Nuitka en Fedora y configurar el PATH automáticamente
# Compatible con Bash y Zsh
#!bin/bash

set -e

echo "Instalando dependencias necesarias..."
sudo dnf install -y python3 python3-devel python3-pip gcc g++ make patchelf clang binutils

echo "Instalando Nuitka (última versión)..."
python3 -m pip install -U nuitka

# Detectar terminal
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
    SHELL_NAME="zsh"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
    SHELL_NAME="bash"
else
    SHELL_RC="$HOME/.bashrc"
    SHELL_NAME="bash (por defecto)"
fi

# Verificar directorio de instalación de pip --user
USER_BASE=$(python3 -m site --user-base)
BIN_PATH="$USER_BASE/bin"

echo "🔍 Verificando ruta de instalación: $BIN_PATH"

# Añadir al PATH si no está ya
if ! echo "$PATH" | grep -q "$BIN_PATH"; then
    echo "Añadiendo $BIN_PATH al PATH en $SHELL_RC..."
    echo "" >> "$SHELL_RC"
    echo "# Añadido automáticamente por el instalador de Nuitka" >> "$SHELL_RC"
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$SHELL_RC"
else
    echo "$BIN_PATH ya está en tu PATH."
fi

# Aplicar los cambios en la sesión actual
export PATH="$BIN_PATH:$PATH"

echo "Recargando configuración de $SHELL_NAME..."
if [ "$SHELL_NAME" = "zsh" ]; then
    source "$HOME/.zshrc"
else
    source "$HOME/.bashrc"
fi

# Verificar instalación
echo "Verificando instalación de Nuitka..."
if command -v nuitka >/dev/null 2>&1; then
    nuitka --version
    echo "Nuitka se instaló correctamente y está lista para usarse."
else
    echo "Nuitka se instaló, pero el comando no se encuentra. Intenta cerrar y volver a abrir la terminal."
fi

