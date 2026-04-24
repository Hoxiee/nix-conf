{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      cat = "bat";
      vi = "nvim";
      vim = "nvim";
      update = "sudo nixos-rebuild switch --flake ~/nix-conf#desktop";
    };

    initContent = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.zoxide.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}