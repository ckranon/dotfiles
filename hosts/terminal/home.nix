{ config, pkgs, ... }:

{
  # Set the Home Manager state version
  home.stateVersion = "24.05"; # Must match your NixOS version

  # Install applications
  home.packages = with pkgs; [
    firefox
    alacritty # Your terminal emulator
    feh       # For setting wallpaper
  ];

  # Configure i3 window manager (your minimalist rice)
  programs.i3 = {
    enable = true;
    package = pkgs.i3-gaps; # Use i3-gaps for aesthetic gaps
    config = {
      modifier = "Mod4"; # Super key

      # Keybinds
      bind = {
        "Mod4+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "Mod4+w" = "exec ${pkgs.firefox}/bin/firefox";
      };

      # Startup commands (set wallpaper)
      startup = [
        # Replace with the actual path to your wallpaper on the VM
        { command = "exec --no-startup-id feh --bg-scale ~/.config/wallpaper/brutalist.jpg"; }
      ];
    };
  };

  # Configure your terminal (Alacritty)
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 12;
      };
      colors = {
        primary = {
          background = "#1a1a1a"; # Dark background
          foreground = "#d0d0d0"; # Light grey text
        };
        # Add a full brutalist color scheme here
        normal = {
          black = "#000000"; white = "#d0d0d0";
          red = "#cc241d"; green = "#98971a";
          yellow = "#d79921"; blue = "#458588";
          magenta = "#b16286"; cyan = "#689d6a";
        };
        bright = {
          black = "#928374"; white = "#ebdbb2";
          red = "#fb4934"; green = "#b8bb26";
          yellow = "#fabd2f"; blue = "#83a598";
          magenta = "#d3869b"; cyan = "#8ec07c";
        };
      };
    };
  };

  # Manage dotfiles (example: a custom script or configuration file)
  # home.file.".config/my-custom-script.sh" = {
  #   source = ./dotfiles/my-custom-script.sh;
  #   executable = true;
  # };

  # Create a directory for your wallpaper and place the image there
  home.activation.setupWallpaperDir = lib.mkIf (config.programs.i3.enable) {
    after = [ "writeBoundary" ];
    # Creates the directory for wallpaper if it doesn't exist
    # Make sure you have the wallpaper image at ~/.config/wallpaper/brutalist.jpg on the VM
    # Or, preferably, you can manage the wallpaper file directly with home.file
    # home.file.".config/wallpaper/brutalist.jpg".source = ./dotfiles/brutalist.jpg;
    # Then change the feh path above to ~/.config/wallpaper/brutalist.jpg
    # This ensures your wallpaper is also part of your managed dotfiles.
  };
}
