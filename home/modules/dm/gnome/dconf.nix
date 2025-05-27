{
  config,
  pkgs,
  lib,
  variables,
  wallpapers,
  ...
}:

{
  #  home.activation.resetCustomKeybindings = lib.hm.dag.entryBefore [ "dconfSettings" ] ''
  #    ${pkgs.glib}/bin/gsettings reset org.gnome.settings-daemon.plugins.media-keys custom-keybindings || true
  #  '';
  #
  home.file."Pictures/default.jpg".source = "${wallpapers}/nix-default.jpg";

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/Pictures/default.jpg";
      picture-uri-dark = "file://${config.home.homeDirectory}/Pictures/default.jpg";
    };

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
      overview-blur = true;
      dash-blur = true;
      blur-amount = 30;
      brightness = 0.6;
      sigma = 30;
      noise-opacity = 0.1;
      customize-panel = true;
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
      close = [ "<Alt>F4" ];
    };

    # Custom keybindings registration — NO trailing slashes here
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-terminal"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3"
      ];
    };

    # Custom keybindings definitions — keys without trailing slashes
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-terminal" = {
      name = "Open Ghostty";
      command = "${variables.terminal}";
      binding = "<Super>t";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Open Browser";
      command = "${variables.browser}";
      binding = "<Super>f";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Open File Explorer";
      command = "${variables.file}";
      binding = "<Super>e";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Close Window";
      command = "xdotool getactivewindow windowclose";
      binding = "<Super>q";
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:swapescape" ];
    };
  };
}
