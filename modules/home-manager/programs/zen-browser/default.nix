{
  config,
  pkgs,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
in {
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "0";
  };

  home.packages = [
    inputs.zen-browser.packages."${system}".default
  ];
}

