{
  pkgs,
  lib,
  config,
  ...
}: {

  home.packages = [pkgs.font-awesome];

  programs.waybar = {
    enable = true;
  };

  xdg.configFile = {
    "waybar/config.jsonc".source = ./config.jsonc;
    "waybar/style.css".source = lib.mkForce ./style.css;
  };
}
