{ pkgs, ... }:
{
  imports = [
    ./dm
    ./users.nix
    ./kernel.nix
    ./gpu.nix
    ./services.nix
    ./virtualisation
  ];
  selectedKernel = "cachy";
  xe.driver.enable = false;
}
