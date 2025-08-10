{ config, pkgs, ... }:

{
  # Import the hardware configuration created by the NixOS installer.
  imports = [
    ./hardware-configuration.nix
  ];
  
  system.stateVersion = "25.05";

  # Use the systemd bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  users.users.cranon = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Set the system's timezone.
  time.timeZone = "America/Chicago";

  # Enable the X server and set up the desktop environment.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;

  home-manager.users.cranon = import ./home.nix;

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;
}
