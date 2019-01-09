#!/bin/bash
set -e

# Install tmux
# https://github.com/tmux/tmux/blob/master/README
cd ~
sudo apt-get install -y build-essential libevent-dev libncurses5-dev
curl -LO https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
tar -xvzf tmux-2.8.tar.gz -C .
cd tmux-2.8/
./configure && make
sudo make install

# Configure tmux and install tpm plugin
# https://github.com/nickjj/dotfiles/blob/master/.tmux.conf
cd ~
curl -LO https://raw.githubusercontent.com/nickjj/dotfiles/master/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm