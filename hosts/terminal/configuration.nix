{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    # Path to your automatically generated hardware configuration.
    # You'll copy this from your VM after installation.
    # e.g., /etc/nixos/hardware-configuration.nix
    # You will need to manually copy the content of this file into your repo.
    (import ../../hardware-configuration.nix) # Adjust path as needed
  ];

  # Basic system settings
  networking.hostName = "vm.name"; # Must match the name in flake.nix
  time.timeZone = "America/Chicago"; # Adjust to your timezone
  i18n.defaultLocale = "en_US.UTF-8";

  # Bootloader setup (for EFI systems)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Enable the X11 windowing system
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true; # Or gdm, sddm
  services.xserver.windowManager.i3.enable = true; # Or sway, awesome, etc.

  # Enable the OpenSSH daemon for remote access (useful for VMs)
  services.openssh.enable = true;

  # Define your user
  users.users.yourusername = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Add other groups as needed
  };

  # Set the NixOS release version
  system.stateVersion = "25.05"; # Or whatever your current NixOS version is
}
