{ config, pkgs, lib, ... }:
{
  # Configuring programs installed in ./software.nix :)
  xdg.configFile.kitty = {
    source = ./config/kitty;
    recursive = true;
  };

  xdg.configFile.mako = {
    source = ./config/mako;
    recursive = true;
  };

  xdg.configFile.sway = {
    source = ./config/sway;
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = ./config/waybar;
    recursive = true;
  };

  xdg.configFile.wofi = {
    source = ./config/wofi;
    recursive = true;
  };

  xdg.configFile.ranger = {
    source = ./config/ranger;
    recursive = true;
  };

  xdg.configFile.zathura = {
    source = ./config/zathura;
    recursive = true;
  };
  
  home.file.".config/starship.toml".source = ./config/starship.toml;

  xdg.mimeApps.defaultApplications = {
    "text/html" = "org.firefox.firefox.desktop";
    "x-scheme-handler/http" = "org.firefox.firefox.desktop";
    "x-scheme-handler/https" = "org.firefox.firefox.desktop";
    "x-scheme-handler/about" = "org.firefox.firefox.desktop";
    "x-scheme-handler/unknown" = "org.firefox.firefox.desktop";
  };
}
