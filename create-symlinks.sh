#!/bin/bash

################################
#                              #
#    You must have cloned      #
#    the repo to ~/dotfiles    #
#                              #
################################

dotfiles_dir=~/dotfiles/dotfiles
log_file=~/install_progress_log.txt

################################
#                              #
#   Remove existing dotfiles   #
#                              #
################################
echo "Removing existing dotfiles..." >> $log_file
sudo rm -rf ~/.Xresources > /dev/null 2>&1
sudo rm -rf ~/.bash_aliases > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config/i3/config > /dev/null 2>&1
sudo rm -rf ~/.config/i3blocks/config > /dev/null 2>&1
sudo rm -rf ~/.config/nvim/init.vim > /dev/null 2>&1
sudo rm -rf ~/.config/nvim/coc-settings.json > /dev/null 2>&1
#sudo rm -rf ~/.config/coc > /dev/null 2>&1
echo "Removing done" >> $log_file

################################
#                              #
#     Checking directories     #
#                              #
################################
[ ! -d ~/.config/i3 ] && mkdir ~/.config/i3
[ ! -d ~/.config/i3blocks ] && mkdir ~/.config/i3blocks
[ ! -d ~/.config/nvim ] && mkdir ~/.config/nvim

################################
#                              #
#       Create symlinks        #
#                              #
################################
echo "Symlinking dotfiles" >> $log_file
ln -sf $dotfiles_dir/.Xresources ~/.Xresources
ln -sf $dotfiles_dir/.bash_aliases ~/.bash_aliases
ln -sf $dotfiles_dir/.gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/i3/config ~/.config/i3/config
ln -sf $dotfiles_dir/i3blocks/config ~/.config/i3blocks/config
ln -sf $dotfiles_dir/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $dotfiles_dir/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
#ln -sf $dotfiles_dir/nvim/coc ~/.config/coc
echo "Symlinking done" >> $log_file

################################
#                              #
#      Set default shell       #
#                              #
################################
#sudo chsh -s /bin/urxvt

################################
#                              #
#        Print summary         #
#                              #
################################
echo -e "\n======== Summary ========\n"
cat $log_file
echo
echo "Finished"
rm $log_file

