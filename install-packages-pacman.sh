# Boosja's Custom Arch Install script
log_file=~install_progress_log.txt

sudo pacman -S awesome neovim curl kitty zsh polybar xmonad xmonad-contrib xmobar xdotool

# Neovim vim-plug
if type -p nvim > /dev/null; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Node (nvm)
if type -p curl > /dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

  if type -p nvm > /dev/null; then
    echo "nvm installed" >> $log_file

    # Node
    nvm install --lts
  else
    echo "nvm FAILED" >> $log_file
  fi
fi

echo -e "\n======== Summary ========\n"
cat $log_file
echo
echo "Finished"
rm $log_file
