##############################
#  ______        ___ __   __ #
# / ___\ \      / / \\ \ / / #
# \___ \\ \ /\ / / _ \\ V /  #
#  ___) |\ V  V / ___ \| |   #
# |____/  \_/\_/_/   \_\_|   #
##############################
{ config, pkgs, lib, ... }:
let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
  dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
  systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      '';
  };
in
{

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
 
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    sway
    dbus-sway-environment
  ];

  environment.sessionVariables = rec {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --greeting 'Access is restricted to authorized personnel only.' --time --cmd sway";
        user = "alice";
      };
      default_session = initial_session;
    };
  };
   
  environment.etc."greetd/environments".text = ''
    sway
  '';

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      swaybg
    ];
  };

  programs.xwayland.enable = true;
}
