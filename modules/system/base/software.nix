{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
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
    linuxKernel.packages.linux_zen.rtl88x2bu
  ];

  environment.shells = [ pkgs.zsh pkgs.bash ];
}
