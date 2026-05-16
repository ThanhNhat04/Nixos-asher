{ config, pkgs, ... }:

{
  home.username = "asher";
  home.homeDirectory = "/home/asher";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Asher";
        email = "hoangthanhnhat0411@gmail.com"; 
      };
      init.defaultBranch = "main";
    };
  };

  # TỰ ĐỘNG CẤU HÌNH SSH ĐỂ DÙNG GITHUB
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
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
    autosuggestion.enable = true;

   history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    shellAliases = {
      v = "nvim";
      ll = "ls -la";
      c = "clear";
      x = "exit";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles#wsl";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "docker-compose" ];
      theme = "robbyrussell";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';


  };

  home.stateVersion = "25.11";
}
