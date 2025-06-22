{inputs, ...}: let
  system = "x86_64-linux";
in {
  home.packages = [
    inputs.hyprshell.packages."${system}".default
  ];
}
