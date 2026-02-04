{ config, pkgs, ... }:

{
  home.username = "mark";
  home.homeDirectory = "/home/mark";
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      nixconfig = "sudo hx /home/mark/nixos-dotfiles/configuration.nix";
      homeconfig = "sudo hx /home/mark/nixos-dotfiles/home.nix";
      nrs = "sudo nixos-rebuild switch";
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

