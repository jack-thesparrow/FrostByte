{
  description = "FrostByte Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Preconfig nixvim
    # nixvim = {
    #   url = "github:elythh/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #    nixvim = {
    #      url = "github:jack-thesparrow/nixvim";
    #      inputs.nixpkgs.follows = "nixpkgs";
    #    };
    nvf = {
      url = "github:jack-thesparrow/schrovimger";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    term2alpha = {
      url = "git+https://git.sr.ht/~zethra/term2alpha";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Zen Browser Flake
    zen-browser.url = "github:conneroisu/zen-browser-flake";
    # Windows Software Emulation Flake
    #win-emu.url = "path:./home/modules/win-emu";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      #nixvim,
      nvf,
      chaotic,
      term2alpha,
      nur,
      stylix,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nur.overlays.default ];
      };
      variables = import ./system/variables.nix;
      wallpapers = ./system/assets/walls;
    in
    {
      nixosConfigurations = {
        FrostByte = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            chaotic.nixosModules.default
            stylix.nixosModules.stylix
          ];
          specialArgs = {
            inherit inputs variables;
          };
        };
      };
      homeConfigurations = {
        rahul = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/home.nix
            stylix.homeModules.stylix
            #win-emu.homeManagerModules.win-emu
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit system;
            inherit variables;
            inherit wallpapers;
          };
        };
      };
    };
}
