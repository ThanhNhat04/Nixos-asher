{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/user.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "asher";

  # Bật Docker Engine native (không cần Docker Desktop)
  virtualisation.docker.enable = true;

  system.stateVersion = "25.11"; 
}
