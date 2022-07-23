# Tested on Ubuntu 22.04
log_file=~/install_progress_log.txt

sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt upgrade -y

sudo apt install i3 -y
if type -p i3 > /dev/null; then
  echo "i3 installed" >> $log_file
else
  echo "i3 FAILED" >> $log_file
fi

sudo apt install i3-gaps -y
if type -p i3 > /dev/null; then
  echo "i3 installed" >> $log_file
else
  echo "i3 FAILED" >> $log_file
fi

sudo apt install i3blocks -y
if type -p i3 > /dev/null; then
  echo "i3 installed" >> $log_file
else
  echo "i3 FAILED" >> $log_file
fi

sudo apt install rxvt-unicode -y
if type -p urxvt > /dev/null; then
  echo "urxvt installed" >> $log_file
else
  echo "urxvt FAILED" >> $log_file
fi

sudo apt install neovim -y
if type -p nvim > /dev/null; then
  echo "neovim installed" >> $log_file
else
  echo "neovim FAILED" >> $log_file
fi

sudo apt install curl -y
if type -p curl > /dev/null; then
  echo "curl installed" >> $log_file
else
  echo "curl FAILED" >> $log_file
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
