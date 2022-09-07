{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    brave
    firefox
    kitty
    neovide
    starship

    gnome.nautilus

    # Launchers
    wofi

    # Utilities
    wl-clipboard
    autotiling
    mako
    waybar
    pywal

    # CLI Tools
    grim
    slurp
    pavucontrol
    wlr-randr
    mpv
    cava
  ];
}
