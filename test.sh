#! /bin/bash

sudo dnf -y update
sudo usermod -aG wheel $USER
yes | dnf copr enable frostyx/qtile 
# not sure if I need @base-x was using it for lightdm. 
dnf install -y git lxappearance pcmanfm qtile qtile-extras kitty picom nitrogen NetworkManager-wifi wget unzip lxdm @base-x dmenu dunst autocpu-freq vim
cd /home/$USER/Downloads
git clone https://github.com/stronk-dev/Tokyo-Night-Linux.git
cp -a /home/$USER/Downloads/Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
cp -a /home/$USER/Downloads/ttf/* /usr/share/fonts
fc-cache -f -v
git clone https://github.com/kwietkannon/qtile
sudo mkdir -p /home/$USER/.config/qtile && cp -a qtile/config.py /home/$USER/.config/qtile/
sudo cp -a qtile/autostart.sh /home/$USER/.config/qtile/
sudo chmod +x /home/$USER/.config/qtile/autostart.sh
sudo systemctl enable lightdm.service
sudo systemctl set-default graphical.target

 
