{ config, pkgs, lib, ... }:
{
  imports = [
    # ./configs.nix
    ./git.nix
    ./shell.nix
  ];
}
