{
  description = "Nixos conf";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    # Reusable function to configure a single NixOS system
    mkNixosSystem = { system, hostname, username, extraModules ? [] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/${hostname}/configuration.nix
          
          # 2. Integrate Home Manager as a NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
	      extraSpecialArgs = {
	        inherit inputs;
	        hostName = hostname;
	      };
              
              # Specify which user's config to apply on this host
              users.${username} = import ./hosts/${hostname}/home.nix;
            };
          }
        ] ++ extraModules;
      };

  in {
    nixosConfigurations = {
      desktop = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "desktop";
        username = "lipe";
      };

      laptop = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "laptop";
        username = "lipe"; 
      };
    };
  };
}
