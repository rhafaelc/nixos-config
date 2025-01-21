{inputs, ...}: let
  system = "x86_64-linux";
in {
  home.packages = [
    inputs.hyprswitch.packages."${system}".default
  ];
}
