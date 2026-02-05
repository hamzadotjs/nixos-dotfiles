# ❄️ NixOS Dotfiles

Personal NixOS configuration using flakes + Home Manager.
Manages system and user configs declaratively, including Qtile, Alacritty, Bash aliases, and Helium browser.

Home Manager handles all app configs — no manual $HOME symlinks needed.

---

Repo Structure:

```
├── alacritty/
│   └── alacritty.toml
├── qtile/
│   ├── config.py
│   └── **pycache**/  # ignore
├── bootloader.nix
├── configuration.nix
├── home.nix
├── flake.nix
└── flake.lock
```
## Note: hardware-configuration.nix is machine-specific. Users must supply their own.

---

### Changing the Username:

This repo uses 'mark' as the system user. You must replace it with your actual username before rebuilding, otherwise Home Manager and symlinks will fail.

#### 1. Update home.nix:

```
home.username = "mark";
home.homeDirectory = "/home/mark";
```

#### Replace 'mark' with your username, e.g., if your username is 'joe':

```
home.username = "joe";
home.homeDirectory = "/home/joe";
```

#### 2. Update symlinks in /etc/nixos:

```
sudo ln -s /home/YOUR_USERNAME/nixos-dotfiles/configuration.nix /etc/nixos/configuration.nix
sudo ln -s /home/YOUR_USERNAME/nixos-dotfiles/home.nix /etc/nixos/home.nix
sudo ln -s /home/YOUR_USERNAME/nixos-dotfiles/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
```

## Tip: The username in home.nix must match the actual Linux user running the system.

---

## Setup Instructions:

### 1. Clone the repo:

```
git clone https://github.com/hamzadotjs/nixos-dotfiles.git ~/nixos-dotfiles
cd ~/nixos-dotfiles
```

### 2. Remove the repo’s hardware-configuration.nix:

```
rm -f ./hardware-configuration.nix
```

This ensures you don’t use someone else’s hardware config — you’ll add your own next.

### 3. Add your own hardware configuration:

```
sudo mv /etc/nixos/hardware-configuration.nix ./hardware-configuration.nix
```

### 4. Backup existing /etc/nixos configs:

```
sudo mkdir -p /etc/nixos/backup
sudo mv /etc/nixos/configuration.nix /etc/nixos/backup/ 2>/dev/null
sudo mv /etc/nixos/home.nix /etc/nixos/backup/ 2>/dev/null
```

### 5. Symlink configs safely (replace YOUR_USERNAME with your actual username):

```
sudo ln -s "$(pwd)/configuration.nix" /etc/nixos/configuration.nix
sudo ln -s "$(pwd)/home.nix" /etc/nixos/home.nix
sudo ln -s "$(pwd)/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix
```

### 6. Rebuild your system:

```
sudo nixos-rebuild switch --flake . --impure
```

---

## System Packages:

```
evil-helix
wget
alacritty
keepassxc
btop
fzf
zoxide
git
neofetch
xwallpaper
pcmanfm
rofi
figlet
neo-cowsay
qutebrowser --> secondary browser
peaclock
gh --> github-cli
ayugram-desktop
Helium browser
```

---

## User Packages & Configs:

### User packages:

```
bat
```

## Shell:

### * Bash
### * Green PS1 prompt (\u@\h:\w$)
### * neofetch runs on startup

### Aliases:

```
nixconfig   -> edit configuration.nix
homeconfig  -> edit home.nix
flakeconfig -> edit flake.nix
nrs         -> rebuild system using flake
list        -> ls -la --color
```

## Apps managed by Home Manager:

```
Qtile -> ~/.config/qtile/
Alacritty -> ~/.config/alacritty/
Bat -> ~/.config/bat/config
Helium browser .keep files for persistent directories
```

---

## Enabled Services:

```
X11 + Qtile window manager
Picom compositor
NetworkManager
Pipewire + Pulse audio
Blueman for Bluetooth
CUPS printing
Home Manager for user configs
```

---

## Notes:


### hardware-configuration.nix is machine-specific — always use your own copy.
### The username in home.nix must match your system username.
### --impure is required because the flake references the symlinked hardware config.
### Home Manager automatically manages $HOME app configs — no manual symlinks for dotfiles needed.
### Qtile and Alacritty configs are sourced from this repo.

---

## License:

This repo is licensed under the MIT license

---
