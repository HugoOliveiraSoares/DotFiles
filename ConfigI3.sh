#!/bin/bash

cd $HOME
sudo apt update && sudo apt upgrade -y

sudo apt install nautilus rofi feh -y

cd ~/.config
mkdir i3/
mkdir picom/
mkdir polybar/

cp ~/DotFiles/i3/config ~/.config/i3/config

cd $HOME
sudo apt install polybar
cp ~/DotFiles/polybar/* ~/.config/polybar/

#sudo apt install picom
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev -y
cd $HOME
git clone https://github.com/yshui/picom.git
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cp ~/DotFiles/picom/* ~/.config/picom/

cd $HOME
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo pip3 install pywal

cd $HOME

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
cp -r ~/DotFiles/fonts/* .
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "Inconsolata Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
curl -flo "mononoki-Regular Nerd Font Complete.ttf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf
sudo apt install fonts-material-design-icons-iconfont
sudo apt install fonts-hack
fc-cache -v

cd $HOME
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc
