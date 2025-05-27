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
  };
  programs.hyprland.enable = true;
}
