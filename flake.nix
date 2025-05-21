{
  description = "FrostByte Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
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
    # Windows Software Emulation Flake
    #win-emu.url = "path:./home/modules/win-emu";
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
          modules = [
            ./home/home.nix
            #win-emu.homeManagerModules.win-emu
          ];
          extraSpecialArgs = {
            inherit inputs;
            #inherit win-emu;
          };
        };
      };
    };
}
