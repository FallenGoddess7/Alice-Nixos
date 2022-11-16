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
