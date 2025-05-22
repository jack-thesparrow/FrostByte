{ pkgs, ... }:
{
  # Allow insecure Ventoy package
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.05"
  ];
  home.packages = with pkgs; [
    ventoy-full-gtk
  ];
}
