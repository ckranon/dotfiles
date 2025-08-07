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
  ];

  programs.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty -e tmux new-session -A -s main";
      
      binds = {
        "Mod4+t" = "exec ${pkgs.alacritty}/bin/alacritty -e tmux new-session -A -s main";
        "Mod4+f" = "exec ${pkgs.firefox}/bin/firefox";
        "Mod4+d" = "exec dmenu_run";
        "Mod4+Shift+e" = "exec i3-msg exit";
      };

      startup = [
        { command = "exec --no-startup-id feh --bg-scale /home/cranon/wallpapers/grey_background.png"; }
      ];

      floating_modifier = "Mod1";
    };
  };

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

  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    extraConfig = ''
      " Enable clipboard access with the system's clipboard
      set clipboard=unnamedplus
    '';
  };
}
