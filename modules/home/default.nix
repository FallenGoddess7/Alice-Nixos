{ config, pkgs, lib, ... }:
{
  imports = [
    ./configs.nix
    ./theme.nix
    #./vim.nix
    ./shell.nix
  ];
}
