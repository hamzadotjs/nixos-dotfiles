{ config, pkgs, ... }:

{
  home.username = "mark";
  home.homeDirectory = "/home/mark";
  home.stateVersion = "25.11";

  # HELIUM PROTECTION (.keep files)
  home.file = {
    ".config/helium/.keep".text = "";
    ".local/share/helium/.keep".text = "";
    ".local/state/helium/.keep".text = "";
    ".cache/helium/.keep".text = "";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nixconfig = "sudo hx ~/nixos-dotfiles/configuration.nix";
      homeconfig = "sudo hx ~/nixos-dotfiles/home.nix";
      flakeconfig = "sudo hx ~/nixos-dotfiles/flake.nix";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw --impure";
      list = "ls -la --color";
    };
    initExtra = ''
      PS1='\[\e[0;32m\]\u@\h:\w\$ \[\e[m\]'
      neofetch
    };

    initExtra = ''
      export PS1='\[\e[0;32m\]\u@\h:\w\$ \[\e[m\]'
      neofetch
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font.normal = {
        family = "JetBrains Mono Nerd Font";
        style = "Regular";
      };
      font.size = 14;
    };
  };

  home.file = {
    ".config/bat/config".text = ''
      --theme="Nord"
      --style="numbers,changes,grid"
      --paging=auto
    '';
    ".config/qtile".source = ./qtile;
  };

  home.packages = with pkgs; [
     bat
   ];
  home.file.".config/bat/config".text = ''
    --theme="Nord"
    --style="numbers,changes,grid"
    --paging=auto
  '';

  home.file.".config/qtile".source = /home/mark/nixos-dotfiles/qtile;

  home.packages = with pkgs; [
    bat
  ];
}

