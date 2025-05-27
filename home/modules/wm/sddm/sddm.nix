{ pkgs, config, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
      };
    };
    desktopManager.hyprland.enable = true;
  };
}
