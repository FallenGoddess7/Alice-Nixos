{ config, pkgs, ... }:

{
  imports = [
    ../../../../modules/home/
  ];

  home.username = "alice";
  home.homeDirectory = "/home/alice";

  home.packages = with pkgs; [
    ### DESKTOP SOFTWARE ---------- {{{
    # Browswers
    brave
    firefox

    # Terminal
    kitty

    # Terminal Apps
    starship
    ranger

    # Launchers
    wofi

    # Utilities
    wl-clipboard
    autotiling
    mako
    waybar

    # Gaming
    discord
    betterdiscordctl
    steam

    # CLI tools
    zathura
    mpv
    neofetch
    pfetch
    figlet
    cbonsai
    grim
    slurp
    pavucontrol
    wlr-randr
    mpv
    cava
    ### ---------- }}}

    ### Programming Languages ---------- {{{
    # C/C++
    clang
    gnumake
    
    # python
    python3

    # lua
    lua
    
    # rust
    rustc
    cargo

    # x86-64 assembly
    nasm
    ### ---------- }}}
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName  = "alicetabby";
    userEmail = "Jacobtrippy124@gmail.com";
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      l = "exa";
      ls = "exa -la --group-directories-first";
      lt = "exa -T -I \"node_modules|venv|Build\"";
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
    };
    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      eval "$(starship init zsh)"
      echo -n "$(pfetch)"
    '';
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
