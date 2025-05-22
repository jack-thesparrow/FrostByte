{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [ ];
  services = {
    xserver = {
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };

      videoDrivers = [ "xe" ];

      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverrides = '''';
      };
    };
    gnome = {
      at-spi2-core.enable = true;
      gnome-keyring.enable = true;
    };
  };
  environment = {
    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "gnome";
      GDK_BACKEND = "wayland,x11";
      NIXOS_OZONE_WL = "1";
      XCURSOR_THEME = "Babita-Original-Classic";
      XCURSOR_SIZE = "24";
    };
    gnome.excludePackages = with pkgs; [
      atomix
      baobab
      cheese
      decibels
      epiphany
      evince
      geary
      gedit
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-contacts
      gnome-disk-utility
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-photos
      gnome-shell-extensions
      gnome-system-monitor
      gnome-terminal
      gnome-tour
      gnome-weather
      hitori
      iagno
      simple-scan
      snapshot
      tali
      yelp
    ];
  };

}
