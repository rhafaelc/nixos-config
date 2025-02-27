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

    # hyprland.url = "github:hyprwm/Hyprland";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    neovim.url = "github:rhafaelc/nixvim";

    hyprswitch.url = "github:h3rmt/hyprswitch/release";

    nix-jetbrains-plugins.url = "github:theCapypara/nix-jetbrains-plugins";

    disko.url = "github:nix-community/disko";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      default = let
        variables = import ./hosts/default/variables.nix;
      in
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs variables;};
          modules = [
            ./hosts/default/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs variables;};
                users.${variables.username} = ./hosts/default/home.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };

      digitalocean = let
        variables = import ./hosts/digitalocean/variables.nix;
      in
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {inherit inputs variables;};
          modules = [
            inputs.disko.nixosModules.disko
            {disko.devices.disk.disk1.device = "/dev/vda";}
            {
              # do not use DHCP, as DigitalOcean provisions IPs using cloud-init
              networking.useDHCP = nixpkgs.lib.mkForce false;

              services.cloud-init = {
                enable = true;
                network.enable = true;
                settings = {
                  datasource_list = ["ConfigDrive"];
                  datasource.ConfigDrive = {};
                };
              };
            }
            ./hosts/digitalocean/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs variables;};
                users = {
                  ${variables.username} = ./hosts/digitalocean/home/rhafaelc.nix;
                  root = ./hosts/diitalocea/home/root.nix;
                };
                backupFileExtension = "backup";
              };
            }
          ];
        };
    };
  };
}
