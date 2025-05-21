{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dconf
  ];

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch Ghostty";
      command = "ghostty";
      binding = "<Super>t";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      toggle-fullscreen = [ "<Alt>Return" ];
    };
  };
}
