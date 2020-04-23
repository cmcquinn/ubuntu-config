#!/bin/bash

# Install prereqs for using gogh themes
sudo apt install -y dconf-cli uuid-runtime

# Install aci theme
bash -c "$(wget -qO- https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/aci.sh)"

# Setup ctrl+tab to switch between tabs in terminal
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

# from https://askubuntu.com/questions/965595/why-does-airplane-mode-keep-toggling-on-my-hp-laptop-in-ubuntu-18-04
echo "HP Keycodes setup..."
sudo cat << EOF > /etc/systemd/system/hp-keycodes.service
[Unit]
Description=HP setkeycodes fix

[Service]
Type=oneshot
Restart=no
RemainAfterExit=no
ExecStart=/usr/bin/setkeycodes e057 240 e058 240

[Install]
WantedBy=rescue.target
WantedBy=multi-user.target
WantedBy=graphical.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable hp-keycodes.service
echo "Reboot required for keycode changes to take effect"

# Install Linux brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install GitHub CLI
brew install hub

# Install TravisCI gem
gem install travis

# Install HP RGS from BYU CAEDM
curl http://remote.et.byu.edu/RGSConnect/rgsconnect-linux-01092017-1.tar.gz | tar -C /tmp xf
sudo /bin/bash -c /tmp/rgsconnect-linux-01092017-1/install.sh