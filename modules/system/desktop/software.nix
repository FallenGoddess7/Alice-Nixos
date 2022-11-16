{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    htop
    killall
    gzip
    unzip
    zip
    exa
  ];

  environment.shells = [ pkgs.zsh pkgs.bash ];
}
