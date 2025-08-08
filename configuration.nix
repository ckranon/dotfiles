{ config, pkgs, ... }:

{
  # Set the system version for reproducible behavior
  system.stateVersion = "25.05";

  # Import the hardware configuration created by the NixOS installer.
  imports = [
    ./hardware-configuration.nix
  ];

  # Define the 'cranon' user
  users.users.cranon = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Use the systemd bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Set the system's timezone.
  time.timeZone = "America/Chicago";

  # Enable the X server and set up the desktop environment.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;

  # Enable Home Manager for the 'cranon' user
  home-manager.users.cranon = import ./home.nix;

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;
}
