#################################################################################
#  _   _  ___  __  __ _____      __  __    _    _   _    _    ____ _____ ____   #
# | | | |/ _ \|  \/  | ____|    |  \/  |  / \  | \ | |  / \  / ___| ____|  _ \  #
# | |_| | | | | |\/| |  _| _____| |\/| | / _ \ |  \| | / _ \| |  _|  _| | |_) | #
# |  _  | |_| | |  | | |__|_____| |  | |/ ___ \| |\  |/ ___ \ |_| | |___|  _ <  #
# |_| |_|\___/|_|  |_|_____|    |_|  |_/_/   \_\_| \_/_/   \_\____|_____|_| \_\ #
#################################################################################
{ config, pkgs, ... }:
{
  imports = [
    ../../../../modules/home
  ];

  home.username = "alice";
  home.homeDirectory = "/home/alice";

  home.packages = with pkgs; [
    ### DESKTOP SOFTWARE ---------- {{{
    # Browswer
    firefox

    # Terminal
    kitty

    # Terminal Apps
    starship
    ranger

    # Launchers
    wofi
    rofi-wayland

    # Utilities
    wl-clipboard
    autotiling
    mako
    waybar

    # Gaming
    discord
    steam
    prismlauncher
    minecraft-server

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
    ### ---------- }}}

    ### Programming Languages ---------- {{{
    # C/C++
    gcc
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
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
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
  
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
