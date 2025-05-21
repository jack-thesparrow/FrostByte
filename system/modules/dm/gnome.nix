{
  config,
  pkgs,
  lib,
  ...
}:
{
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
  };
}
