#!/bin/bash

echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /tmp
sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb
