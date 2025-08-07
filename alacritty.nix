{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 12.0;
        normal.family = "monospace";
      };
      colors.primary = {
        background = "#282a36";
        foreground = "#f8f8f2";
      };
    };
  };
}
