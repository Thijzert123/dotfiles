# Dotfiles

My dotfiles. Not for you (probably).

## Installation
Run `install.sh` as the user you want to configure the dotfiles for on a fresh `archinstall`ed system:
```
curl -fsSL https://github.com/Thijzert123/dotfiles/raw/refs/heads/main/install.sh | bash
```

- Reboot to apply changes.
- When first logging in, you might want to run `hyprctl reload` to load the Noctalia-generated Hyprland configuration files.
- Click `Noctalia Settings > Security > Greeter > Noctalia Greeter > Sync Now` to update the greeter theme.
- To update dotfiles, initialize this repository again with `chezmoi`.

## Todo
- https://docs.noctalia.dev/noctalia/configuration/shell/?section=encrypted-storage-master-key#encrypted-storage-master-key
- Fix caps lock being esc in games
- Update plugin
- Very fix for audio issues. Installed packages:
  - `alsa-firmware` (probably not the one)
  - `pavucontrol` (nice but also not what fixed it probably)
  - `pipewire-libcamera` ???
  - `pipewire-pluse` (might be it, should add to installation script anyway because of general compatibility)
  - `pipewire-alsa` (same as above, but didn't fix it, it was already fixed when installing this)
