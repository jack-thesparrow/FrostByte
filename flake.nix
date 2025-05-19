{
  description = "FrostByte Config";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = { self, nixpkgs, home-manager, nvf, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      FrostByte = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./system/configuration.nix
        ];
      };
      #NVF-NixOS Module
      packages.system.default = (
        nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [ ./home/modules/nvf-configuration.nix ];
        }).neovim;
    };
    homeConfigurations = {
      rahul = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ];
      };
    };
  };
}
