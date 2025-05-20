{
  description = "FrostByte Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:elythh/nixvim";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      chaotic,
      nur,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nur.overlays.default ];
      };
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
          extraSpecialArgs = { inherit inputs; };

          modules = [
            ./home/home.nix
            #inputs.nixvim.packages.${pkgs.system}.default
          ];
        };
      };
    };
}
