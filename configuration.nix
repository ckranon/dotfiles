{ config, pkgs, ... }:

{
  # A commented tree structure of your modular configuration files.
  # /etc/nixos/
  # ├── configuration.nix  <- This file
  # ├── hardware-configuration.nix
  # ├── packages.nix
  # ├── programs/
  # │   ├── alacritty.nix
  # │   ├── i3.nix
  # │   └── neovim.nix
  # └── users/
  #     └── yourusername.nix

  # Import the modular configuration files.
  # Each file handles a specific part of your system's configuration.
  imports = [
    # hardware-configuration.nix:
    # Contains hardware-specific settings (e.g., bootloader, file systems, etc.)
    # that are auto-generated during installation.
    ./hardware-configuration.nix

    # packages.nix:
    # Defines all the system-wide packages (applications, utilities)
    # that are available to all users.
    ./packages.nix

    # programs/i3.nix:
    # Configures the i3 window manager, including keybindings and behavior.
    ./programs/i3.nix

    # programs/alacritty.nix:
    # Configures the Alacritty terminal emulator with specific settings.
    ./programs/alacritty.nix

    # programs/neovim.nix:
    # Configures Neovim and its features, such as clipboard support.
    ./programs/neovim.nix

    # users/yourusername.nix:
    # Defines your main user account, groups, and any user-specific packages.
    ./users/yourusername.nix
  ];

  # Basic system settings
  networking.hostName = "nixos-minimal-rice";
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the usage of unfree packages, which is necessary for some applications,
  # including certain codecs that Firefox might need.
  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system and the required desktop components
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.i3.enable = true;

  # Enable networking with NetworkManager
  networking.networkmanager.enable = true;

  # Enable the sound server
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Set the system-wide default font
  fonts.fontconfig.enable = true;

  # Set the NixOS release version
  system.stateVersion = "25.05";
}
