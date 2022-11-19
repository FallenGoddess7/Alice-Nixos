#########################################################
#  ____   ___  _____ _______        ___    ____  _____  #
# / ___| / _ \|  ___|_   _\ \      / / \  |  _ \| ____| #
# \___ \| | | | |_    | |  \ \ /\ / / _ \ | |_) |  _|   #
#  ___) | |_| |  _|   | |   \ V  V / ___ \|  _ <| |___  #
# |____/ \___/|_|     |_|    \_/\_/_/   \_\_| \_\_____| #
#########################################################
{ config, pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = false;
    # extraConfig = (builtins.readFile ./init.vim);
    plugins = with pkgs.vimPlugins; [
      ranger-vim
      ale
      lualine-nvim
      gruvbox-nvim
      vim-nix
      rust-tools-nvim
    ];
  };
}
