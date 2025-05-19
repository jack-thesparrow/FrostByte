# nvf.nix
{
  description = "NVF Config Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = { nvf, nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system; 
    };
  in {
    packages.${system}.default = (
      nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ 
          ./nvf-config.nix
        ];
      }
      ).neovim;

      nixosModules.default = nvf.nixosModules.default;
  };
}
