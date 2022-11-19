{ config, pkgs, lib, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ 
      colorizer
      gruvbox
      lightline-vim
      vim-gitbranch
      vim-nix
      vim-polyglot
    ];
    extraConfig = ''
      if has('termguicolors')
          set termguicolors
      endif

      set background=dark
      let g:gruvbox_contrast_dark = 'medium'
      let g:gruvbox_transparent_bg = 1
      let g:gruvbox_italic = 1
      let g:gruvbox_bold = 1

      colorscheme gruvbox

      let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \
      \     'right': [ [ 'wpercent' ],
      \                [ 'linerow' ],
      \                [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \     'linerow': 'row: %l | col: %c',
      \     'wpercent': 'percent %p%%'
      \ },
      \ 'component_function': {
      \     'gitbranch': 'gitbranch#name'
      \ },
      \}
      set laststatus=2

      set nocompatible
      syntax on
      set number
      set tabstop=4
      set expandtab
      set hlsearch
      set incsearch
      set showmatch
      set ignorecase
      set smartcase
      set noshowmode
    '';
  };
}
