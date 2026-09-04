#!/bin/bash

echo "==> Installing pacman packages..."
sudo pacman --noconfirm --needed -S \
  adw-gtk-theme \
  base-devel \
  bash-completion \
  bluez \
  btop \
  chezmoi \
  ddcutil \
  eza \
  firefox \
  foot \
  fzf \
  gdu \
  git \
  helix \
  hyprland \
  kdenlive \
  less \
  libreoffice-fresh \
  networkmanager \
  noctalia \
  noto-fonts \
  nwg-look \
  openssh \
  pipewire \
  pipewire-jack \
  power-profiles-daemon \
  prismlauncher \
  qt5-wayland \
  qt6-multimedia-gstreamer \
  qt6-wayland \
  starship \
  tree \
  ttf-jetbrains-mono-nerd \
  uwsm \
  wireplumber \
  xdg-desktop-portal-hyprland \
  zoxide

echo "==> Enabling services..."
sudo systemctl enable NetworkManager.service bluetooth.service

echo "==> Installing yay..."
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

echo "==> Installing AUR packages..."
yay --noconfirm --needed -S \
  qt6ct-kde

echo "==> Setting GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'

echo "==> Cloning dotfiles..."
chezmoi init --apply git@github.com:Thijzert123/dotfiles.git

echo "==> Installing hyprland plugins..."
mkdir -p ~/.config/hypr/plugins
cd ~/.config/hypr/plugins
git clone https://github.com/zjeffer/split-monitor-workspaces
cd split-monitor-workspaces
# Use hyprland version here
git fetch -Ppft && git checkout release/0.56.x
