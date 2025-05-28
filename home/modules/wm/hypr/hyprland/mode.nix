{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    qt6ct
  ];
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  #  gtk = {
  #    enable = true;
  #    theme = {
  #      name = "Adwaita-dark";
  #      package = pkgs.gnome-themes-extra;
  #    };
  #  };
}
