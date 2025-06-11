{
  pkgs,
  system,
  inputs,
  ...
}@args:
{
  home.packages = [
    inputs.nvf.packages.${pkgs.system}.default
    #inputs.nixvim.packages.${pkgs.system}.default
  ];
}
