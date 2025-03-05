{
  pkgs,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
in {
  home.packages = [
    pkgs.ripgrep
    inputs.neovim.packages."${system}".default
  ];
}

