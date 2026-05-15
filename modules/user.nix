{ config, pkgs, ... }:

{
  users.users.asher = {
    isNormalUser = true;
    description = "Asher";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };
}
