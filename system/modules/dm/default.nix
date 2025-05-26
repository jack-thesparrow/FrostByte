{ pkgs, lib, ... }:
let
  desktopEnvironment = "gnome";
  gnome = import ./gnome.nix;
  kde = import ./kde.nix;
  commom = import ./common.nix;

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
    commom
    selectedDE
  ];
  services.displayManager.autoLogin = {
    enable = false;
    user = "rahul";
  };
}
