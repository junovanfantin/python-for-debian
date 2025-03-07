#!/bin/bash

# Atualizando a lista de pacotes e o sistema
echo "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

# Instalando pacotes essenciais
echo "Instalando pacotes necessários..."
sudo apt install -y python3 python3-pip python3-venv python3-dev build-essential libssl-dev libffi-dev

# Criando um ambiente virtual
echo "Criando ambiente virtual em ~/.python_env"
mkdir -p ~/.python_env
python3 -m venv ~/.python_env

# Ativando o ambiente virtual
echo "Ativando ambiente virtual..."
source ~/.python_env/bin/activate

# Atualizando pip e instalando pacotes básicos
echo "Atualizando pip e instalando pacotes essenciais..."
pip install --upgrade pip setuptools wheel

# Criando o arquivo de configuração para permitir uso do pip sem sudo
echo "Criando configuração para uso seguro do pip..."
mkdir -p ~/.config/pip
echo "[global]" > ~/.config/pip/pip.conf
echo "require-virtualenv = true" >> ~/.config/pip/pip.conf

# Mensagem final
echo "Configuração concluída!"
echo "Para usar o ambiente virtual, execute: source ~/.python_env/bin/activate"
