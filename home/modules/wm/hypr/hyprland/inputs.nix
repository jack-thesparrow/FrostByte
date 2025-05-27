{ config, pkgs, ... }:
{
  config = {
    wayland.windowManager.hyprland = {
      settings = {
        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "caps:swapescape";
          kb_rules = "";

          follow_mouse = 1;

          sensitivity = 0;

          touchpad = {
            natural_scroll = true;
          };
        };
      };
    };
  };
}
