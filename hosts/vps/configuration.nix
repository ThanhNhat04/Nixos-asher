{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/user.nix
  ];

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  }; 
  system.stateVersion = "25.11";
}
