#!/bin/bash

# Atualiza e atualiza as dependências
echo 'Atualizando o sistema e as dependências...'
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean

# Instalação de ferramentas essenciais
echo 'Instalando ferramentas essenciais...'
sudo apt install curl wget openssh-server openssh-client git tar silversearcher-ag unzip -y

# Instalação de dependências para Python
echo 'Instalando dependências para Python...'
sudo apt-get update
sudo apt-get install --no-install-recommends -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt-get install -y gcc make zlib1g-dev libreadline8 sqlite3 python-tk python3-tk tk-dev

# Instalação do asdf (gerenciador de versões)
echo 'Instalando asdf...'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Reinicie o terminal ou execute "source ~/.bashrc" para carregar as configurações
echo 'Por favor, reinicie o terminal ou execute "source ~/.bashrc" para carregar as configurações.'