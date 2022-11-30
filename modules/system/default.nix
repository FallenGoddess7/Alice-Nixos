{ config, pkgs, lib, ... }:
{
  imports = [
    ./java.nix
    ./software.nix
    ./sway.nix
  ];
}
