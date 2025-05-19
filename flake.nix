{
  description = "FrostByte Config";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "path:./standalone/nvf";
  };
  outputs = { self, nixpkgs, home-manager, nvf, ...} @ inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    #pkgs = nixpkgs.legacyPackages.${system};
    pkgs = import nixpkgs { inherit system; };
  in {
    #NVF-NixOS Module
    packages.${system}.default = nvf.packages.${system}.default;

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
