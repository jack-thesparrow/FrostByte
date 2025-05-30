{ pkgs, ... }:
{
  imports = [
    #./dm
    ./wm
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
  };
}
