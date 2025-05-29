{
  pkgs,
  system,
  inputs,
  ...
} @ args: {
  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default
  ];
}
