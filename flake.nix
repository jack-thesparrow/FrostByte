{
  description = "FrostByte Config";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:mikaelfangel/nixvim-config";
  };
  outputs = { self, nixpkgs, home-manager, ...} @ inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    #pkgs = nixpkgs.legacyPackages.${system};
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations = {
      FrostByte = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./system/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inputs = inputs;
        };
        modules = [ 
          ./home/home.nix
          inputs.nixvim.nixosModules.default
        ];
      };
    };
  };
}
