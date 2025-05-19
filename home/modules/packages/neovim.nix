{ config, pkgs, inputs, nvf,... }:
{
  home.packages = [
    inputs.nvf.packages.${pkgs.system}.default
  ];
}
  

