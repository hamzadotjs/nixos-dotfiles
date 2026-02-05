{ config, pkgs, ... }:

{
  home.username = "mark";
  home.homeDirectory = "/home/mark";
  home.stateVersion = "25.11";

<<<<<<< HEAD
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
=======
  programs.bash = {
    enable = true;
    shellAliases = {
      nixconfig = "sudo hx /home/mark/nixos-dotfiles/configuration.nix";
      homeconfig = "sudo hx /home/mark/nixos-dotfiles/home.nix";
      nrs = "sudo nixos-rebuild switch";
    };

    initExtra = ''
      export PS1='\[\e[0;32m\]\u@\h:\w\$ \[\e[m\]'
>>>>>>> 0e6559e83bc0591212f7ed466e578fd6bce09d33
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
<<<<<<< HEAD

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
=======
  home.file.".config/bat/config".text = ''
    --theme="Nord"
    --style="numbers,changes,grid"
    --paging=auto
  '';

  home.file.".config/qtile".source = /home/mark/nixos-dotfiles/qtile;

  home.packages = with pkgs; [
    bat
  ];
>>>>>>> 0e6559e83bc0591212f7ed466e578fd6bce09d33
}

