{
  description = "Nixos conf";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    nixpkgs-opencode.url = "github:NixOS/nixpkgs/dc5d91f840324650bac8c379428c7037a416959a"; # WARNING: opencode pin v.18.29

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    swww.url = "github:LGFae/swww";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, nixpkgs-opencode, home-manager, ... }@inputs: # WARNING: opencode 1.18.29 hack
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
                inherit nixpkgs-opencode; # WARNING: opencode 1.18.29 hack
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
