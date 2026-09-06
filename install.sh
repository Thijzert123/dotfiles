#!/bin/bash

set -eEo pipefail

# echo "==> Disabling sudo password for the duration of this script..."
# TEMP_SUDO="/etc/sudoers.d/Thijzert123-dotfiles-installation-temp"
# cleanup() {
#     rm -f "$TEMP_SUDO"
# }
# trap cleanup EXIT
# printf '%s ALL=(ALL:ALL) NOPASSWD: ALL\n' "$USERNAME" \
#     > "$TEMP_SUDO"
# chmod 0440 "$TEMP_SUDO"
# visudo -cf "$TEMP_SUDO"

echo "==> Enabling multilib..."
sudo sed -i \
  -e '/^[[:space:]]*#\[multilib\]/,/^[[:space:]]*#Include/ s/^[[:space:]]*#//' \
  /etc/pacman.conf

echo "==> Installing pacman packages..."
sudo pacman --noconfirm --needed -Syu \
  accountsservice \
  adw-gtk-theme \
  base-devel \
  bash-completion \
  bash-language-server \
  bat \
  bluez \
  btop \
  chezmoi \
  ddcutil \
  discord \
  eza \
  fd \
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
  lldb \
  lua-language-server \
  man \
  man-db \
  markdown-oxide \
  marksman \
  meld \
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
  ripgrep \
  rustup \
  signal-desktop \
  starship \
  steam \
  systemd-lsp \
  taplo \
  tldr \
  tombi \
  tree \
  ttf-jetbrains-mono-nerd \
  unzip \
  uwsm \
  video-downloader \
  vlc \
  vscode-json-languageserver \
  wireplumber \
  wl-clipboard \
  xdg-desktop-portal-hyprland \
  zip \
  zoxide

echo "==> Enabling services..."
sudo systemctl enable \
  accounts-daemon.service \
  avahi-daemon.service \
  bluetooth.service \
  greetd.service \
  NetworkManager.service

echo "==> Installing Rust..."
rustup toolchain install stable

echo "==> Updating tldr cache..."
tldr --update

echo "==> Installing yay..."
[ -d /tmp/yay ] || git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm --needed

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

echo "==> Cloning dotfiles..."
chezmoi init --apply --purge --force https://github.com/Thijzert123/dotfiles.git

echo "==> Installing hyprland plugins..."
mkdir -p ~/.config/hypr/plugins
cd ~/.config/hypr/plugins
[ -d split-monitor-workspaces ] || git clone https://github.com/zjeffer/split-monitor-workspaces
cd split-monitor-workspaces
# Use hyprland version here
git fetch -Ppft
git checkout release/0.56.x

echo
echo "done"
