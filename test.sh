#! /bin/bash
##### OS Info
##### Fedora 36 Netinstall
##### Additional software "Common NetworkMaanager Submodules" and "Standard" added
##### Laptop model System 76 darter pro (Darp5)
##### missing iwlwifi-9000-pu-b0-jf-b0-46

sudo dnf -y update
sudo usermod -aG wheel $USER
echo yes | sudo dnf copr enable frostyx/qtile 
# not sure if I need @base-x was using it for lightdm. 
sudo dnf install -y git lxappearance pcmanfm qtile qtile-extras kitty picom feh NetworkManager-wifi wget unzip lxdm @base-x rofi dunst vim firefox \
i3lock
sudo mkdir /home/$USER/Downloads && sudo chown $USER:$USER Downloads
cd /home/$USER/Downloads
git clone https://github.com/stronk-dev/Tokyo-Night-Linux.git
sudo cp -a /home/$USER/Downloads/Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes
sudo wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
sudo cp -a /home/$USER/Downloads/ttf/* /usr/share/fonts
fc-cache -f -v
git clone https://github.com/kwietkannon/qtile
sudo mkdir -p /home/$USER/.config/qtile && sudo cp -a qtile/config.py /home/$USER/.config/qtile/
sudo cp -a qtile/autostart.sh /home/$USER/.config/qtile/
sudo chmod +x /home/$USER/.config/qtile/autostart.sh
sudo systemctl enable lxdm.service
sudo systemctl set-default graphical.target

##### RPM Fusion Repos
echo yes| sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group update core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y 
sudo dnf groupupdate sound-and-video -y

#### Wallpaper
sudo wget https://resi.ze-robot.com/dl/as/astronaut-29-1920%C3%971080.jpg -P /home/$USER/Downloads
sudo echo '#!/bin/sh' >> .fehbg && sudo echo "feh --no-fehbg --bg-scale" /home/$USER/Downloads/astronaut-29-1920x1080.jpg >> /home/$USER/.fehbg && sudo chmod +x .fehbg

##### Kitty theme/config
sudo mkdir -p /home/$USER/.config/kitty/themes && sudo chown kwietkannon:kwietkannon /home/$USER/.config/kitty/
git clone https://github.com/davidmathers/tokyo-night-kitty-theme.git
sudo curl https://raw.githubusercontent.com/kwietkannon/.config/main/kitty/kitty.conf >> /home/$USER/.config/kitty/kitty.conf
sudo mv tokyo-night-kitty-theme/tokyo-night-kitty.conf /home/$USER/.config/kitty/themes




 
