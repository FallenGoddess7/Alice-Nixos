{ config, pkgs, lib, ... }:
{
  imports = [
    ./java.nix
    ./sway.nix
  ];
}
