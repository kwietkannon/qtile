#! /bin/bash

sudo dnf -y update
yes | dnf copr enable frostyx/qtile 
dnf install -y git lxappearance pcmanfm qtile qtile-extras kitty picom nitrogen NetworkManager-wifi
cd /home/$USER/Downloads
git clone https://github.com/stronk-dev/Tokyo-Night-Linux.git
cp -a /home/$USER/Downloads/Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
cp -a /home/$USER/Downloads/ttf/* /usr/share/fonts
fc-cache -f -v
git clone https://github.com/kwietkannon/qtile
sudo rm /home/$USER/.config/qtile/config.py
sudo cp -a qtile/config.py /home/$USER/.config/qtile/
sudo cp -a qtile/autostart.sh /home/$USER/.config/qtile/
sudo chmod +x /home/$USER/.config/qtile/autostart.sh
 
