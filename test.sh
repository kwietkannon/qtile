#! /bin/bash

dnf install -y git lxappearance
dnf copr enable frosty/qtile
dnf install qtile
dnf install qtile-extra
cd ~/Downloads
got clone https://github.com/stronk-dev/Tokyo-Night-Linux.git
cp -a ~/Downloads/Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
cp -a ~/Downloads/ttf/* /usr/share/fonts
fc-cache -f -v
 
