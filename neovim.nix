{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    extraConfig = ''
      " Enable clipboard access with the system's clipboard
      set clipboard=unnamedplus
    '';
  };
}
