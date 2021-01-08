#!/bin/bash

cd $HOME
sudo apt update && sudo apt upgrade -y
sudo apt install xorg -y
sudo apt install build-essential git curl cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev -y
#sudo apt install i3 -y
sudo apt install update-manager -y
sudo apt install software-properties-gtk -y
sudo apt install lightdm -y
sudo apt install gnome-flashback -y
sudo apt install gnome-session-bin -y
sudo apt install gnome-control-center -y
sudo apt install gnome-settings-daemon -y
sudo apt install nautilus -y
sudo apt install rofi -y

cd ~/.config
mkdir i3/
mkdir picom/
mkdir polybar/

cd $HOME
sudo add-apt-repository ppa:kgilmer/speed-ricer -y
sudo apt-get update
sudo apt install i3-gaps

cp ~/DotFiles/i3/config ~/.config/i3/config

cd $HOME
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/local/bin
sudo make install
cp ~/DotFiles/polybar/* ~/.config/polybar/

sudo apt install picom
# cd $HOME
# git clone https://github.com/jonaburg/picom
# cd picom
# meson --buildtype=release . build
# ninja -C build
# # To install the binaries in /usr/local/bin (optional)
# sudo ninja -C build install
# cp ~/DotFiles/picom/* ~/.config/picom/

cd $HOME
sudo apt install python3 -y
sudo apt install python3-pip -y
pip3 install pywal

cd $HOME
# git clone https://github.com/ryanoasis/nerd-fonts.git
# cd nerd-fonts/
# chmod +x install.sh && ./install.sh

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "Inconsolata Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
curl -flo "mononoki-Regular Nerd Font Complete.ttf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf
sudo apt install fonts-material-design-icons-iconfont
sudo apt install fonts-hack
fc-cache -v

cd $HOME
git clone https://github.com/stoeckmann/xwallpaper.git
./autogen.sh
./configure
make
make install

cd $HOME
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc