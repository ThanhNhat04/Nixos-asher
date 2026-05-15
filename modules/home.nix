{ config, pkgs, ... }:

{
  home.username = "asher";
  home.homeDirectory = "/home/asher";

  programs.git = {
    enable = true;
    userName = "Asher";
    userEmail = "hoangthanhnhat0411@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # TỰ ĐỘNG CẤU HÌNH SSH ĐỂ DÙNG GITHUB
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles#wsl";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "docker-compose" ];
      theme = "robbyrussell";
    };
  };

  home.stateVersion = "25.11";
}
