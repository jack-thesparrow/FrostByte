{ pkgs, ... }:
{
  imports = [
    ./dm
    ./packages
    ./cli-tools.nix
  ];
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "okular.desktop";
      };
    };

    portal = {
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
  };

}
