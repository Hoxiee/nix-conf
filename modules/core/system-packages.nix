{ ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim
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
    jq
    just
  ];
}