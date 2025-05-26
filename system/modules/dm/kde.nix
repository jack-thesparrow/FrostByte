{ pkgs, ... }:
let
  kdeApps = with pkgs; [

  ];
in
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        settings = {
          Theme = {
            CursorTheme = "Bibata-Original-Classic";
          };
        };
      };
    };
    desktopManager.plasma6.enable = true;
  };
  environment.systemPackages = kdeApps;
  programs.kdeconnect.enable = true;
}
