{
  description = "FrostByte Config";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = { self, nixpkgs, home-manager, nvf, ...} @ inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    #NVF-NixOS Module
    packages."x86_64-linux".default = (
      nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ 
          ./home/modules/nvf-configuration.nix
        ];
      }).neovim;
    nixosConfigurations = {
      FrostByte = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./system/configuration.nix
          nvf.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ];
      };
    };
  };
}
