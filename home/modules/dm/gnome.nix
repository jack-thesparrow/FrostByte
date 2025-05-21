{
  config,
  pkgs,
  lib,
  ...
}:

let
  customBindings = [
    {
      name = "Launch Ghostty";
      command = "ghostty";
      binding = "<Super>t";
    }
    {
      name = "Open File Manager";
      command = "nautilus";
      binding = "<Super>e";
    }
    {
      name = "Screenshot";
      command = "gnome-screenshot --interactive";
      binding = "<Super>p";
    }
  ];

  keybindPaths = lib.imap0 (
    i: _: "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${toString i}/"
  ) customBindings;

  keybindSettings = lib.listToAttrs (
    lib.imap0 (i: binding: {
      name = "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${toString i}";
      value = {
        name = binding.name;
        command = binding.command;
        binding = binding.binding;
      };
    }) customBindings
  );

in
{
  home.packages = with pkgs; [
    dconf
    gnome-screenshot
  ];

  dconf.settings = keybindSettings // {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = keybindPaths;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
    };
  };
}
