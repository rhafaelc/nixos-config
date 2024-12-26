{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/core.nix

    ../../modules/home-manager/programs
    ../../modules/home-manager/terminal
    ../../modules/home-manager/shells
    ../../modules/home-manager/hyprland
  ];
}
