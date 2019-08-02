#!/bin/bash

# Install prereqs for using gogh themes
sudo apt install -y dconf-cli uuid-runtime

# Install aci theme
bash -c "$(wget -qO- https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/aci.sh)"

# Setup ctrl+tab to switch between tabs in terminal
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
