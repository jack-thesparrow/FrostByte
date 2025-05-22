{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Orchis";
      icon-theme = "Tela";
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      panel-blur = true;
      overview-blur = true;
      dash-blur = true;
      blur-amount = 30;
      brightness = 0.6;
      sigma = 30;
      noise-opacity = 0.1;
      customize-panel = true;
      panel-opacity = 0.0;
      panel-brightness = 0.7;
      panel-blur-override = true;

      panel-css = ''
        border-radius: 16px;
        margin: 6px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
      '';
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      extend-height = false;
      dock-fixed = false;
      intellihide = true;
      transparency-mode = "DYNAMIC";
      background-opacity = 0.2;
      custom-theme-shrink = true;
      show-mounts = false;
      dash-max-icon-size = 48;
      unity-backlit-items = true;
      click-action = "minimize-or-overview";
      isolate-workspaces = false;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Orchis";
    };

    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "sloppy";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [
        "<Super>q"
        "<Alt>F4"
      ];
    };

    # Register your custom keybinding paths here — critical!
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    # Custom keybindings definitions
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Open Ghostty";
      command = "ghostty";
      binding = "<Super>t";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Open Firefox";
      command = "firefox";
      binding = "<Super>f";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Open Nautilus";
      command = "nautilus";
      binding = "<Super>e";
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:swapescape" ];
    };
  };
}
