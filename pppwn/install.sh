#!/bin/bash
sudo rm -f /usr/lib/systemd/system/bluetooth.target
sudo rm -f /usr/lib/systemd/system/network-online.target
sudo sed -i 's^sudo bash /boot/firmware/pppwn/run.sh \&^^g' /etc/rc.local
echo '[Service]
WorkingDirectory=/boot/firmware/pppwn
ExecStart=/boot/firmware/pppwn/run.sh
Restart=never
User=root
Group=root
Environment=NODE_ENV=production
[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/taikucing.service
sudo chmod u+rwx /etc/systemd/system/taikucing.service
sudo systemctl enable taikucing
echo -e '\033[36mInstall complete,\033[33m Rebooting\033[0m'
sudo reboot
