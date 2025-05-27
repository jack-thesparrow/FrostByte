{
  config,
  pkgs,
  lib,
  ...
}:

let
  gnomeExts = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    user-themes
  ];
in
{
  imports = [
    ./dconf.nix
  ];

  programs.gnome-shell.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Orchis";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Tela";
      package = pkgs.tela-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  home.packages =
    with pkgs;
    [
      xdotool
      orchis-theme
      tela-icon-theme
      gnome-tweaks
      polkit_gnome
      lxsession
    ]
    ++ gnomeExts;

  # Declarative installation of extensions
  xdg.dataFile."gnome-shell/extensions/blur-my-shell@aunetx" = {
    source = "${pkgs.gnomeExtensions.blur-my-shell}/share/gnome-shell/extensions/blur-my-shell@aunetx";
  };

  xdg.dataFile."gnome-shell/extensions/dash-to-dock@micxgx.gmail.com" = {
    source = "${pkgs.gnomeExtensions.dash-to-dock}/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com";
  };

  xdg.dataFile."gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com" = {
    source = "${pkgs.gnomeExtensions.user-themes}/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com";
  };

  home.file.".themes/Orchis-Custom/gnome-shell/gnome-shell.css".source = ./gnome-shell.css;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = "gtk";
      };
    };
  };
  #programs.gnome-polkit.enable = true;
}
