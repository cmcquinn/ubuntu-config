#!/bin/bash
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
