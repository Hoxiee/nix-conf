# Zsh shell with Starship prompt.
# Starship theme lives in config/starship.toml — edit it without touching Nix.
{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -la --icons --git";
      lt = "eza --tree --icons";
      cat = "bat";
      cd = "z"; # zoxide
      vim = "nvim";
    };

    initContent = ''
      # zoxide — smarter cd
      eval "$(zoxide init zsh)"
    '';
  };

  # zoxide — directory jumper, replaces cd for frequent paths.
  programs.zoxide.enable = true;

  programs.starship = {
    enable = true;
    # Config is sourced from the plain TOML file — not managed as Nix attrsets.
    # configFile = ../../config/starship.toml; # TODO: Unknown attribute
  };

  # fzf shell integration — Ctrl+R history, Ctrl+T file search, Alt+C cd.
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
