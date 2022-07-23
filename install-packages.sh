# Tested on Ubuntu 22.04
log_file=~/install_progress_log.txt

sudo add-apt-repository ppa:regolith-linux/release -y
sudo apt update -y
sudo apt upgrade -y
sudo apt install i3-gaps i3blocks rxvt-unicode neovim curl -y

if type -p i3 > /dev/null; then
  echo "i3 installed" >> $log_file
else
  echo "i3 FAILED" >> $log_file
fi

I3GAPS_OK=$(dpkg -s i3-gaps | grep "install ok installed")
if [ "" != "$I3GAPS_OK" ]; then
  echo "i3-gaps installed" >> $log_file
else
  echo "i3-gaps FAILED" >> $log_file
fi

if type -p i3blocks > /dev/null; then
  echo "i3blocks installed" >> $log_file
else
  echo "i3blocks FAILED" >> $log_file
fi

if type -p urxvt > /dev/null; then
  echo "urxvt installed" >> $log_file
else
  echo "urxvt FAILED" >> $log_file
fi

if type -p nvim > /dev/null; then
  echo "neovim installed" >> $log_file
else
  echo "neovim FAILED" >> $log_file
fi

if type -p curl > /dev/null; then
  echo "curl installed" >> $log_file
else
  echo "curl FAILED" >> $log_file
fi


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
