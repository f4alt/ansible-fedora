#!/bin/bash

set -e

HOME="/home/chris"
# Unzip plasma themes
unzip -o "$HOME/Downloads/plasma6macos-plasma-themes.zip" -d "$HOME/.local/share"

# Unzip GTK theme config
unzip -o "$HOME/Downloads/plasma6macos-gtk-theme-config.zip" -d "$HOME"

# Set GTK theme to dark mode
ln -sf "$HOME/.config/gtk-4.0/gtk-Dark.css" "$HOME/.config/gtk-4.0/gtk.css"

# Unzip Kvantum theme
unzip -o "$HOME/Downloads/plasma6macos-Kvantum.zip" -d "$HOME/.config"

# Unzip icons
#unzip -o "$HOME/Downloads/plasma6macos-icons.zip" -d "$HOME/.local/share"
unzip -o "$HOME/Downloads/WhiteSur.zip" -d "$HOME/.local/share"
unzip -o "$HOME/Downloads/WhiteSur-dark.zip" -d "$HOME/.local/share"
unzip -o "$HOME/Downloads/WhiteSur-light.zip" -d "$HOME/.local/share"

# Unzip cursors
unzip -o "$HOME/Downloads/plasma6macos-cursors.zip" -d "$HOME/.local/share"

# Unzip fonts
unzip -o "$HOME/Downloads/plasma6macos-fonts.zip" -d "$HOME/.local/share/"
cp "$HOME/Downloads/SF-Pro-Display-Heavy.otf" "$HOME/.local/share"

# Unzip wallpapers
unzip -o "$HOME/Downloads/plasma5macos-wallpapers.zip" -d "$HOME/.local/share"

# Unzip plasmoids and widgets
unzip -o "$HOME/Downloads/plasma6macos-plasmoids-widgets.zip" -d "$HOME/.local/share/plasma"

# Unzip KWin themes
unzip -o "$HOME/Downloads/plasma6macos-kwin.zip" -d "$HOME/.local/share/plasma"

# Unzip SDDM theme
sudo unzip -o "$HOME/Downloads/plasma6macos-sddm.zip" -d /

# Install Plymouth themes
sudo dnf install -y plymouth plymouth-theme-script

# Unzip Plymouth theme
sudo unzip -o "$HOME/Downloads/plasma6macos-plymouth-theme.zip" -d /usr/share/plymouth/themes

# Set default Plymouth theme to macOS
sudo plymouth-set-default-theme -R macOS

# Quit Plasma shell
kquitapp6 plasmashell || true

# Unzip KDE config
unzip -o "$HOME/Downloads/plasma6macos-kdeconfig.zip" -d "$HOME/.config"

# Start Plasma shell
kstart plasmashell &> /dev/null &

# Logout KDE session
qdbus-qt6 org.kde.Shutdown /Shutdown org.kde.Shutdown.logout || true

# Add Albert repository
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_40/home:manuelschneid3r.repo

# Install Albert launcher
sudo dnf install -y albert

# Unzip Albert launcher config
unzip -o "$HOME/Downloads/albert-launcher-config.zip" -d "$HOME"

# Unzip Albert themes
sudo unzip -o "$HOME/Downloads/albert-theme-Light-Dark.zip" -d /usr/share/albert/widgetsboxmodel/themes/

# Install Zsh
sudo dnf install -y zsh

# Install WhiteSur Firefox theme
cd "$HOME/Downloads"
if [ ! -d "WhiteSur-firefox-theme" ]; then
    git clone https://github.com/vinceliuice/WhiteSur-firefox-theme.git
fi
cd WhiteSur-firefox-theme
./install.sh -m

# make sure we're on dark color scheme
plasma-apply-colorscheme MacSequoiaDark
