#! /bin/bash
##### OS Info
##### Fedora 36 Netinstall
##### Additional software "Common NetworkMaanager Submodules" and "Standard" added
##### Laptop model System 76 darter pro (Darp5)
##### missing iwlwifi-9000-pu-b0-jf-b0-46

sudo dnf -y update
sudo usermod -aG wheel $USER
echo yes | sudo dnf copr enable frostyx/qtile
echo yes | sudo dnf copr enable szydell/system76
echo yes | sudo dnf copr enable zawertun/hack-fonts

# not sure if I need @base-x was using it for lightdm. 
sudo dnf install -y git lxappearance pcmanfm qtile qtile-extras kitty picom feh NetworkManager-wifi wget unzip lxdm @base-x rofi dunst vim firefox \
i3lock discord bpytop hack-fonts
sudo mkdir /home/$USER/Downloads && sudo chown $USER:$USER Downloads
cd /home/$USER/Downloads
git clone https://github.com/stronk-dev/Tokyo-Night-Linux.git
sudo cp -a /home/$USER/Downloads/Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes
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

##### Install system 76 packages
sudo dnf install system76* -y
sudo systemctl enable --now system76-power.service
sudo dnf install firmware-manager -y
sudo systemctl enable --now system76-firmware-daemon
sudo gpasswd -a $USER adm
sudo systemctl enable system76-power system76-power-wake
sudo systemctl start system76-power
sudo dnf install system76-dkms - 
sudo systemctl enable dkms
sudo dnf install system76-acpi-dkms -y
sudo systemctl enable dkms

##### Rofi theme 
sudo mkdir /home/$USER/.config/rofi && sudo chown kwietkannon:kwietkannon rofi
curl https://raw.githubusercontent.com/dracula/rofi/master/theme/config1.rasi -o /home/$USER/.config/rofi/config.rasi

##### Visual studio Repos
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

##### auto-cpufreq 
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo auto-cpufreq --install
# neeed to switch to acpi
# sudo vim /etc/default/grub
# add the line to grub: GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable"
# sudo grub2-mkconfig -o /boot/grub2/grub.cfg
# reboot
git clone https://github.com/kwietkannon/kwietkannon.git
sudo cp -a kwietkannon/etc/auto-cpurfreq.conf /etc/auto-cpufreq.conf

###### For adding dynamic tiling for i3-gaps
pip3 install i3ipc
cd ~/Downloads
git clone https://github.com/olemartinorg/i3-alternating-layout
// Add exec --no-startup-id /home/$USER/Downloads/i3-alternating-layout/alternating_layouts.py

