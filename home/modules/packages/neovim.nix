{
  config,
  pkgs,
  lib,
  nixvim,
  system,
  ...
}@args:
let
  inputs = args.inputs;
in
{
  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default
  ];
}
