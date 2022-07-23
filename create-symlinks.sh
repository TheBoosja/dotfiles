#!/bin/bash

################################
#                              #
#    You must have cloned      #
#    the repo to ~/dotfiles    #
#                              #
################################

dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt

################################
#                              #
#   Remove existing dotfiles   #
#                              #
################################
echo "Removing existing dotfiles..." >> $log_file
sudo rm -rf ~/.Xresources > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.config/i3 > /dev/null 2>&1
sudo rm -rf ~/.config/i3blocks > /dev/null 2>&1
sudo rm -rf ~/.config/nvim > /dev/null 2>&1
#sudo rm -rf ~/.config/coc > /dev/null 2>&1
echo "Removing done" >> $log_file

################################
#                              #
#       Create symlinks        #
#                              #
################################
echo "Symlinking dotfiles" >> $log_file
ln -sf $dotfiles_dir/.Xresources ~/.Xresources
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
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

