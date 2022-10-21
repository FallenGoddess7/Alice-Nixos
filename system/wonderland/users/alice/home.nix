{ config, pkgs, ... }:

{
  imports = [
    ../../../../modules/home/base
    ../../../../modules/home/desktop
  ];

  home.username = "alice";
  home.homeDirectory = "/home/alice";

  home.packages = with pkgs; [
    # Desktop software

    # Gaming
    discord
    betterdiscordctl
    steam

    # Development tools
    

    # CLI tools
    zathura
    mpv
    neofetch
    pfetch
    figlet
    cbonsai

    # Programming Languages
    #C/C++
    clang
    gnumake
    
    #python
    python3
    
    #rust
    rustc
    cargo
  ];

  programs.git = {
    userName  = "alicetabby";
    userEmail = "Jacobtrippy124@gmail.com";
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
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
