{ config, pkgs, lib, ... }:
{
  imports = [
    ./java.nix
    ./nixos.nix
    ./software.nix
    ./sway.nix
  ];
}
