{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/core.nix

    ../../modules/home-manager/programs
  ];
}
