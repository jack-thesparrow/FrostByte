{ pkgs, ... }:
{
  imports = [
    #./ntfs3g.nix
    ./users.nix
    ./kernel.nix
    ./gpu.nix
  ];
  selectedKernel = "cachy";
  xe.driver.enable = true;

  environment.systemPackages = with pkgs; [
    ntfs3g
    pciutils
  ];
}
