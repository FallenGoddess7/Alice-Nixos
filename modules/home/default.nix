{ config, pkgs, lib, ... }:
{
  imports = [
    ./config.nix
    ./theme.nix
    ./shell.nix
  ];
}
