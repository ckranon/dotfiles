# ====================================================================
# The following sections represent the content of the new, modular files.
# You would save each of these code blocks into their respective files
# in the /etc/nixos/ directory.
# ====================================================================

# File: /etc/nixos/packages.nix
# This file defines all system-wide packages.
# You can also add more packages here as needed.
# --------------------------------------------------------------------
 { config, pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
     firefox
     alacritty
     neovim
     tmux
     feh
     git
     nano
     xclip
     xdg-utils
   ];
 }
