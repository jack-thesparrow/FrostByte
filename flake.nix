{
  description = "FrostByte Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:elythh/nixvim";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      chaotic,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      #pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        FrostByte = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            chaotic.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        rahul = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          #inherit system;
          extraSpecialArgs = {
            inputs = inputs;
          };
          modules = [
            ./home/home.nix
            #inputs.nixvim.packages.${pkgs.system}.default
          ];
        };
      };
    };
}
