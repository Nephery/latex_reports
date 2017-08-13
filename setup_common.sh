#!/usr/bin/env bash

echo
echo "Running Common Setup..."
echo

sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y vim

cat "/vagrant/startup_configs/bashrc" >> /home/vagrant/.bashrc
cat "/vagrant/startup_configs/vimrc" >> /home/vagrant/.vimrc

curl -fLo /home/vagrant/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
