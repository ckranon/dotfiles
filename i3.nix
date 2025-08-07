{ config, pkgs, ... }:

{
  programs.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty -e tmux new-session -A -s main";
      
      binds = {
        "${config.programs.i3.config.modifier}+t" = "exec ${config.programs.i3.config.terminal}";
        "${config.programs.i3.config.modifier}+f" = "exec ${pkgs.firefox}/bin/firefox";
        "${config.programs.i3.config.modifier}+d" = "exec dmenu_run";
        "${config.programs.i3.config.modifier}+Shift+e" = "exec i3-msg exit";
      };

      startup = [
        { command = "exec --no-startup-id feh --bg-scale /home/yourusername/wallpapers/grey_background.png"; }
      ];

      floating_modifier = "Mod1";
    };
  };
}
