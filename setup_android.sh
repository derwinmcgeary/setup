#!/bin/bash
# Simple setup.sh for configuring Ubuntu
# for automated setup.

sudo apt-get install -y git
sudo apt-get install -y curl xclip screen

# Install Android studio
sudo apt-add-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install android-studio android-tools-adb android-tools-fastboot
# Install emacs (whatever version) and magit
sudo apt-get install -y emacs magit

# Install some tools of the trade
sudo apt-get install inkscape librsvg2-bin audacity
cd $HOME
# Set up an ssh key for github
ssh-keygen -t rsa -b 4096 -C "derwinmcgeary+web@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat .ssh/id_rsa.pub | tee | xclip
echo "Public key copied to clipboard, go to https://github.com/settings/ssh to add it"

# git pull and install dotfiles as well

if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone github@github.com:derwinmcgeary/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

echo "Setup Complete!"
