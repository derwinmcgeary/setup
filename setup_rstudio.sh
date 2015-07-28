#!/bin/bash
# Simple setup.sh for configuring Ubuntu
# for automated setup.

sudo apt-get install -y git
sudo apt-get install -y curl xclip screen

# Install R stuff 
sudo add-apt-repository deb http://cran.ma.imperial.ac.uk/bin/linux/ubuntu vivid
sudo apt-get update
sudo apt-get install -y r-base r-base-dev r-recommended
# and R Studio
echo "Downloading R Studio..."
wget https://download1.rstudio.org/rstudio-0.99.467-amd64.deb
echo "...installing..."
sudo dpkg -i rstudio*.deb
echo "...done!"
# Install emacs (whatever version) and magit
sudo apt-get install -y emacs magit ess

# Install some tools of the trade
sudo apt-get install -y inkscape librsvg2-bin audacity
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
ln -s dotfiles/git-prompt.sh .git-prompt.sh
echo "Setup Complete!"
