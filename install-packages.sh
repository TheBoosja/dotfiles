log_file=~/install_progress_log.txt

sudo apt update
sudo apt upgrade

sudo apt install curl
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
