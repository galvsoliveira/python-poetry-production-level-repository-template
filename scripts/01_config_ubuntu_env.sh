#!/bin/bash

echo 'Updating system and dependencies...'
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean

echo 'Installing essential tools...'
sudo apt install curl wget openssh-server openssh-client git tar silversearcher-ag unzip -y

echo 'Installing Python dependencies...'
sudo apt-get update
sudo apt-get install --no-install-recommends -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt-get install -y gcc make zlib1g-dev libreadline8 sqlite3 python-tk python3-tk tk-dev

echo 'Installing asdf (versions manager)...'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.bashrc

echo 'Please, reboot the terminal and run "source ~/.bashrc" to load the settings.'
