{
  config,
  pkgs,
  lib,
  ...
}@args:
let
  inputs = args.inputs;
in
{
  imports = [
    ./modules
  ];
  home.username = "rahul";
  home.homeDirectory = "/home/rahul";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
