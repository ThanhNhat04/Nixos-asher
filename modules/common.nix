{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    
    git curl wget openssh
    zsh tmux kitty
    
    # Dev Stack
    go nodejs_24 docker
    
    # Dependencies LazyVim
    neovim
    gcc            
    ripgrep        
    fd             
    unzip          
    wl-clipboard   
  ];
   
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;
}
