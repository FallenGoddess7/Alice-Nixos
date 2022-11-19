##############################
# _   _ _____  _____  ____   #
#| \ | |_ _\ \/ / _ \/ ___|  #
#|  \| || | \  / | | \___ \  #
#| |\  || | /  \ |_| |___) | #
#|_| \_|___/_/\_\___/|____/  #
##############################
{ config, pkgs, lib, ... }:
{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
  };
}
