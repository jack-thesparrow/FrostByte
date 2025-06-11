{
  pkgs,
  inputs,
  system,
  ...
}@args:
{
  home.packages = with pkgs; [
    inputs.term2alpha.packages.${system}.default
  ];
}
