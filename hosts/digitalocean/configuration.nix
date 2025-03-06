{
  modulesPath,
  lib,
  pkgs,
  variables,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
    pkgs.neovim
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];



  users.groups.rhafaelc = {};

  users.users = {
     ${variables.username} = {
      isNormalUser = true;
      group = "rhafaelc";  # Set a group
      extraGroups = ["wheel"];
      packages = with pkgs; [];
      shell = pkgs.zsh;

      initialPassword = "nixos";
      openssh.authorizedKeys.keys = [
        # change this to your ssh key
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKGzdfoeFFKCaOS1svih9nA65qrAGG+dWcWIm3Az3yHw rhafaelc@nixos"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDG1U+u3YCy7mj9c3a9WQcskvaMZyYd4SDe0/+7pmKcr rhafaelchandra@cs-646411612480-default"
      ];
    };
    root = {
      packages = with pkgs; [];
      shell = pkgs.zsh;

      initialPassword = "nixos";
      openssh.authorizedKeys.keys = [
        # change this to your ssh key
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKGzdfoeFFKCaOS1svih9nA65qrAGG+dWcWIm3Az3yHw rhafaelc@nixos"
      ];
    };
  };

  programs.zsh.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}
