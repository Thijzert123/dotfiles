#!/bin/bash

echo "==> Installing pacman packages..."
sudo pacman --noconfirm --needed -S \
  accountsservice \
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
  greetd \
  helix \
  hyprland \
  kdenlive \
  krita \
  less \
  libreoffice-fresh \
  nautilus \
  networkmanager \
  noctalia \
  noto-fonts \
  nwg-look \
  obs-studio \
  openssh \
  pinta \
  pipewire \
  pipewire-jack \
  power-profiles-daemon \
  prismlauncher \
  qt5-wayland \
  qt6-multimedia-gstreamer \
  qt6-wayland \
  rustup \
  signal-desktop \
  starship \
  tree \
  ttf-jetbrains-mono-nerd \
  uwsm \
  video-downloader \
  vlc \
  wireplumber \
  xdg-desktop-portal-hyprland \
  zoxide

echo "==> Enabling services..."
sudo systemctl enable \
  accounts-daemon.service \
  bluetooth.service \
  greetd.service \
  NetworkManager.service

echo "==> Installing Rust..."
rustup toolchain install stable

echo "==> Installing yay..."
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

echo "==> Installing AUR packages..."
yay --noconfirm --needed -S \
  localsend-bin \
  noctalia-greeter \
  qt6ct-kde \
  spotify

echo "==> Setting GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'

echo "==> Installing greeter..."
sudo sed -i 's|^command = .*|command = "/usr/bin/noctalia-greeter-session"|' /etc/greetd/config.toml
USER_TO_USE=$(whoami)
sudo noctalia-greeter passwordless-sync enable $USER_TO_USE

echo "==> Cloning dotfiles..."
chezmoi init --apply git@github.com:Thijzert123/dotfiles.git

echo "==> Installing hyprland plugins..."
mkdir -p ~/.config/hypr/plugins
cd ~/.config/hypr/plugins
git clone https://github.com/zjeffer/split-monitor-workspaces
cd split-monitor-workspaces
# Use hyprland version here
git fetch -Ppft && git checkout release/0.56.x
