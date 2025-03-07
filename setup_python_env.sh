#!/bin/bash

# Atualizando a lista de pacotes e o sistema
echo "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

# Instalando pacotes essenciais para Python
echo "Instalando pacotes necessários..."
sudo apt install -y python3 python3-pip python3-venv python3.11-venv python3-dev build-essential libssl-dev libffi-dev

# Verificando se o pacote python3-venv foi instalado corretamente
if ! dpkg -l | grep -qw python3-venv; then
  echo "Erro: python3-venv não instalado. Verifique o repositório."
  exit 1
fi

# Criando o ambiente virtual
echo "Criando ambiente virtual em ~/.python_env"
mkdir -p ~/.python_env
python3 -m venv ~/.python_env

# Verificação para garantir que o venv foi criado
if [ ! -d "~/.python_env/bin" ]; then
  echo "Erro ao criar o ambiente virtual!"
  exit 1
fi

# Ativando o ambiente virtual
echo "Ativando ambiente virtual..."
source ~/.python_env/bin/activate

# Atualizando pip e instalando pacotes essenciais
echo "Atualizando pip e instalando pacotes básicos..."
pip install --upgrade pip setuptools wheel

# Criando o arquivo de configuração para evitar uso do pip fora do ambiente virtual
echo "Configurando segurança do pip..."
mkdir -p ~/.config/pip
echo "[global]" > ~/.config/pip/pip.conf
echo "require-virtualenv = true" >> ~/.config/pip/pip.conf

echo "Ambiente virtual criado com sucesso!"
echo "Para ativar o ambiente: source ~/.python_env/bin/activate"
