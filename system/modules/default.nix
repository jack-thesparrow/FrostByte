{ pkgs, ... }:
let
  environment = "twm";
  dm = import ./dm;
  twm = import ./wm;

  selectedEnvironment =
    if environment == "twm" then
      twm
    else if environment == "dm" then
      dm
    else
      { };
in
{
  imports = [
    selectedEnvironment
    ./users.nix
    ./kernel.nix
    ./gpu.nix
    ./services.nix
    ./virtualisation
  ];
  selectedKernel = "cachy";
  xe.driver.enable = false;
}
