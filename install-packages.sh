log_file=~/install_progress_log.txt

sudo apt update
sudo apt upgrade

sudo apt curl
if type -p curl > /dev/null; then
  echo "curl installed" >> $log_file

  # nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  if type -p nvm > /dev/null; then
    echo "nvm installed" >> $log_file

    # Node
    nvm install --lts
  else
    echo "nvm FAILED" >> $log_file
  fi
else
  echo "curl FAILED" >> $log_file
fi

echo -e "\n======== Summary ========\n"
cat $log_file
echo
echo "Finished"
rm $log_file
