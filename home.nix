{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    firefox
    alacritty
    neovim
    tmux
    feh
    git
    nano
    xclip
    xdg-utils
    dmenu
  ];

  # These lines create symlinks to your native configuration files.
  xdg.configFile."i3/config".source = ./dotfiles/i3/config;
  xdg.configFile."alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
  xdg.configFile."nvim/init.lua".source = ./dotfiles/nvim/init.lua;
}
