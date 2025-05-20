{
  config,
  pkgs,
  lib,
  chaotic,
  ...
}:
let
  default = pkgs.linuxPackages;
  cachy = pkgs.linuxPackages_cachyos;
  latest = pkgs.linuxPackages_latest;
  lts = pkgs.linuxPackages_lts;
  zen = pkgs.linuxPackages_zen;

  kernelMap = {
    default = default;
    cachy = cachy;
    latest = latest;
    lts = lts;
    zen = zen;
  };
  selected = config.selectedKernel;
in
{
  options.selectedKernel = lib.mkOption {
    type = lib.types.enum (builtins.attrNames kernelMap);
    default = "default";
    description = "Choose your kernel variant";
  };
  config.boot.kernelPackages = kernelMap.${selected};
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
}
