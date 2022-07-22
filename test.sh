#! /bin/bash
##### OS Info
##### Fedora 36 Netinstall
##### Additional software "Common NetworkMaanager Submodules" and "Standard" added
##### Laptop model System 76 darter pro (Darp5)
##### missing iwlwifi-9000-pu-b0-jf-b0-46

sudo dnf -y update
sudo usermod -aG wheel $USER
dnf copr enable frostyx/qtile 
# not sure if I need @base-x was using it for lightdm. 
dnf install -y git lxappearance pcmanfm qtile qtile-extras kitty picom feh NetworkManager-wifi wget unzip lxdm @base-x rofi dunst autocpu-freq vim firefox \
i3lock
sudo mkdir /home/$USER/Downloads
cd /home/$USER/Downloads
sudo chown $USER:$USER Downloads
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
sudo systemctl enable lxdm.service
sudo systemctl set-default graphical.target

##### RPM Fusion Repos
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group update core -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y 
sudo dnf groupupdate sound-and-video -y

#### Wallpaper
wget https://resi.ze-robot.com/dl/as/astronaut-29-1920%C3%971080.jpg -P /home/$USER/Downloads
feh --bg-scale /home/$USER/Downloads/astronaut-29-1920x1080.jpg



 
