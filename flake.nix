{
  description = "Nixos config flake";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # Use upstream's dependencies so the official binary cache matches.
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        laptop =
          let
            variables = import ./hosts/laptop/variables.nix;
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs variables; };
            modules = [
              ./hosts/laptop/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = { inherit inputs variables; };
                  users.${variables.username} = ./hosts/laptop/home.nix;
                  backupFileExtension = "backup";
                };
              }
            ];
          };

      };

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;
    };
}
