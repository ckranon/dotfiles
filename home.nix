{ config, pkgs, ... }:

# This variable now points to a 'dotfiles' directory
# located in the same directory as your flake.nix file.
let
  dotfilesDir = ./dotfiles;
in

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    ungoogled-chromium
    alacritty
    neovim
    tmux
    feh
    git
    nano
    xclip
    xdg-utils
    dmenu
    picom
    tree
  ];

  # These lines create symlinks to your configuration files,
  # now using the relative path.
  xdg.configFile."i3/config".source = "${dotfilesDir}/i3/config";
  xdg.configFile."alacritty/alacritty.toml".source = "${dotfilesDir}/alacritty.toml";
  xdg.configFile."nvim/init.lua".source = "${dotfilesDir}/nvim/init.lua";
  xdg.configFile."picom/picom.conf".source = "${dotfilesDir}/picom.conf";

}
