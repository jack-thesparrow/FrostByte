{ ... }:
{
  imports = [
    ./ntfs3g.nix
    ./users.nix
    ./kernel.nix
  ];
  selectedKernel = "cachy";
}
