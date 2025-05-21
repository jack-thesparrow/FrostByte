{ pkgs, ... }:
{
  imports = [
    ./dm
    ./users.nix
    ./kernel.nix
    ./gpu.nix
    ./services.nix
  ];
  selectedKernel = "cachy";
  xe.driver.enable = true;
}
