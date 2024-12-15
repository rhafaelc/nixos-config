{
  config,
  pkgs,
  system,
  inputs,
  ...
}:
let
  system = "x86_64-linux";
in {
  home.packages = [
    inputs.zen-browser.packages."${system}".default
  ];
}
