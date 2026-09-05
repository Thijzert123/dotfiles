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
  rustup \
  starship \
  tree \
  ttf-jetbrains-mono-nerd \
  uwsm \
  wireplumber \
  xdg-desktop-portal-hyprland \
  zoxide \
  krita \
  nautilus \
  pinta \
  signal-desktop \
  vlc \
  obs-studio \
  video-downloader \
  accountsservice \
  greetd

echo "==> Enabling services..."
sudo systemctl enable \
  NetworkManager.service \
  bluetooth.service \
  accounts-daemon.service \
  greetd.service

echo "==> Installing Rust..."
rustup toolchain install stable

echo "==> Installing yay..."
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

echo "==> Installing AUR packages..."
yay --noconfirm --needed -S \
  qt6ct-kde \
  localsend-bin \
  spotify \
  noctalia-greeter

echo "==> Setting GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'

echo "==> Installing greeter..."
sudo sed -i 's|^command = .*|command = "/usr/bin/noctalia-greeter-session"|' /etc/greetd/config.toml

echo "==> Cloning dotfiles..."
chezmoi init --apply git@github.com:Thijzert123/dotfiles.git

echo "==> Installing hyprland plugins..."
mkdir -p ~/.config/hypr/plugins
cd ~/.config/hypr/plugins
git clone https://github.com/zjeffer/split-monitor-workspaces
cd split-monitor-workspaces
# Use hyprland version here
git fetch -Ppft && git checkout release/0.56.x
