{
  inputs,
  ...
}:
let
  system = "x86_64-linux";
in {
  programs.ripgrep.enable = true;
  home.packages = [
    inputs.nixvim.packages."${system}".default
  ];
}
