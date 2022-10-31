{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    # Browsers
    brave
    firefox

    # Terminal
    kitty

    # Terminal Apps
    starship
    ranger

    # Launchers
    wofi
    rofi-wayland

    # Utilities
    wl-clipboard
    autotiling
    mako
    waybar

    # CLI Tools
    grim
    slurp
    pavucontrol
    wlr-randr
    mpv
    cava
  ];
}
