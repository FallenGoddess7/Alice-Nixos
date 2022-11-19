{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      l = "exa";
      ls = "exa -la --group-directories-first";
      lt = "exa -T -I \"node_modules|venv|Build\"";
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
    };
    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      eval "$(starship init zsh)"
      echo -n "$(pfetch)"
    '';
  };
}
