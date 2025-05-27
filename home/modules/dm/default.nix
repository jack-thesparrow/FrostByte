{ pkgs, lib, ... }:
let
  desktopEnvironment = "gnome";
  gnome = import ./gnome;
  kde = import ./kde;

  selectedDE =
    if desktopEnvironment == "gnome" then
      gnome
    else if desktopEnvironment == "kde" then
      kde
    else
      { };
in
{
  imports = [
    selectedDE
  ];
}
