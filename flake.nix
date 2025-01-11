{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";

    hyprland.url = "github:hyprwm/Hyprland";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    neovim.url = "github:rhafaelc/neovim";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        default = let
          variables = import ./hosts/default/variables.nix;
        in nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs variables; };
          modules = [
            ./hosts/default/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs variables; };
                users.${variables.username} = ./hosts/default/home.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };

        workmachine = let
          variables = import ./hosts/workmachine/variables.nix;
        in nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs variables; };
          modules = [
            ./hosts/workmachine/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs variables; };
                users.${variables.username} = ./hosts/workmachine/home.nix;
              };
            }
          ];
        };
      };
    };
}
