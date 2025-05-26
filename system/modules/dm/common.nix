{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };

      displayManager.sessionCommands = ''
        ${pkgs.xorg.xsetroot}/bin/xsetroot -xcf ${pkgs.bibata-cursors}/share/icons/Bibata-Original-Classic/cursors/left_ptr 24
      '';
    };
  };

  environment.sessionVariables = {
    #    NIXOS_OZONE_WL = "1";
    #    XCURSOR_THEME = "Bibata-Original-Classic";
    #    XCURSOR_SIZE = "24";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "gnome";
    GDK_BACKEND = "wayland,x11";
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Babita-Original-Classic";
    XCURSOR_SIZE = "24";
  };
  #  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
