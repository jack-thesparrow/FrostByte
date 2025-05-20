{ pkgs, ... }:
{
  imports = [
    ./dm
    ./users.nix
    ./kernel.nix
    ./gpu.nix
  ];
  selectedKernel = "cachy";
  xe.driver.enable = false;

  environment.systemPackages = with pkgs; [
    ntfs3g
    pciutils
  ];
}
