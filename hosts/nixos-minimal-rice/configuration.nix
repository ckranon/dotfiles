{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-minimal-rice";
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.i3.enable = true;

  networking.networkmanager.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  fonts.fontconfig.enable = true;

  users.users.yourusername = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  system.stateVersion = "24.05";
}
