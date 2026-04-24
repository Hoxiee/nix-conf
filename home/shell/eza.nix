{ pkgs, ... }:
{
  programs.eza = {
    enable = true;
    icons = "auto";
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;

    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--header" # Show header row
      "--git-ignore"
      "--icons=always"
      # "--time-style=long-iso" # ISO 8601 extended format for time
      "--classify" # append indicator (/, *, =, @, |)
      "--hyperlink" # make paths clickable in some terminals
    ];
  };

  programs.zsh.shellAliases = {
    ls = "eza --icons";
    ll = "eza -la --icons --git";

    # Tree
    lt = "eza -a --tree --icons";
    lt1 = "lt -L 1";
    lt2 = "lt -L 2";
    lt3 = "lt -L 3";

    # lt = "eza -a --tree --icons";
  };
}