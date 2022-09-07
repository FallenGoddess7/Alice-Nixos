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

  home.file.".config/starship.toml".source = ./config/starship.toml;
}
