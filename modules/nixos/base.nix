{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    neovim
    ripgrep
    fd
    bat
    eza
    fzf
    htop
    wget
    curl
    unzip
    zip
    file
    which
    tree
    jq
    just
  ];
}
