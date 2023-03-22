###############################
#  _   _ _____  _____  ____   #
# | \ | |_ _\ \/ / _ \/ ___|  #
# |  \| || | \  / | | \___ \  #
# | |\  || | /  \ |_| |___) | #
# |_| \_|___/_/\_\___/|____/  #
###############################

# Alice's Configuration of NIXOS

{ config, pkgs, home-manager, ... }:
{
  imports = [ 
    ../../modules/system
    ./hardware-configuration.nix
  ];
  nixpkgs.overlays = [
    (import ../../overlays/discord.nix)
    (import ../../overlays/electron.nix)
  ];
  
  # Allow Home-Manager to manage user accounts
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.alice = import ./alice/home.nix;

  # User creation & setup
  users.users.alice = {
    isNormalUser = true;
    description = "alice";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "adbusers"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;
  
  # System-wide Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    curl
    exa
    git
    gzip
    htop
    killall
    unzip
    vim
    wget
    zip
  ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Special Programs
  programs = {
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  # Default Apps
  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
  };
  environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";

  # Fonts
  fonts.fonts = with pkgs; [
    inconsolata
    iosevka
    font-awesome
    powerline-fonts
  ];
  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "iosevka" ];
    };
  };
  
  # Time zone & localization
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.utf8";
  
  # X11 Keymap
  services.xserver.layout = "us";

  # Networking
  networking.hostName = "wonderland";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = true;

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Hardware
  hardware.opengl.enable = true;
  hardware.openrazer.enable = true;
  services.printing.enable = true;

  # MTP Devices
  services.gvfs.enable = true;
  programs.adb.enable = true;

  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "quiet" "splash" "udev.log_priority=3" "rd.udev.log_level=3" ];
    initrd.kernelModules = [ "amdgpu" ];
   
   # Silent Boot
    initrd.verbose = false;
    consoleLogLevel = 0;
    plymouth.enable =true;
    
    loader = {
      systemd-boot.enable = true;
      timeout = 8;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };

  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
  };

  # State Version is the version the system was installed at.
  # Updating this can break your system!
  # Ensure your configs will work with the newer version to avoid breakages!
  system.stateVersion = "22.11";
}
