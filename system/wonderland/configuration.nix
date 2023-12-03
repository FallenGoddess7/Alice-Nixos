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
  nix.settings.trusted-users = ["alice"];
  
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
    p7zip
    xboxdrv
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
  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    iosevka
    font-awesome
    powerline-fonts
    ubuntu_font_family
  ];
  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Ubuntu" ];
      sansSerif = [ "Ubuntu" ];
      monospace = [ "Iosevka" "Ubuntu" ];
    };
  };
  fonts.fontDir.enable = true;
  
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
  hardware.openrazer.users = ["alice"];
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
      systemd-boot.consoleMode = "max";
      timeout = 8;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };

  systemd.watchdog.rebootTime = "0";

  console = {
    earlySetup = true;
    font = null;
    keyMap = "us";
    colors = [
      "282828"
      "ea6962"
      "a9b665"
      "e78a4e"
      "7daea3"
      "d3869b"
      "89b482"
      "d4be98"
      "32302f"
      "ea6962"
      "a9b665"
      "e78a4e"
      "7daea3"
      "d3869b"
      "89b482"
      "d4be98"
    ];
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
