{ config, pkgs, ... }:

{
  # Import the hardware configuration created by the NixOS installer.
  imports = [
    ./hardware-configuration.nix
  ];

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

  # Enable Home Manager for your user, 'root' in this case.
  home-manager.users.root = import ./home.nix;

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;
}
