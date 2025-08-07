{ config, pkgs, ... }:

{
  users.users.yourusername = {
    isNormalUser = true;
    description = "Christian Ranon";
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [];
  };
}
