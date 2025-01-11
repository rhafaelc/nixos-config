{
  config,
  pkgs,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
in {
  home.packages = [
    inputs.neovim.packages."${system}".default
  ];
}

