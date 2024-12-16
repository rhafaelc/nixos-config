{
  pkgs,
  lib,
  config,
  ...
}: {

  imports = [
  #  ./config.nix
    ./style.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.waybar = {
    enable = true;
  };

  xdg.configFile = {
    "waybar/mocha.css".source = ./mocha.css;
    "waybar/config.jsonc".source = ./config.jsonc;
  };
  #xdg.configFile."waybar/config" = lib.mkIf (config.programs.waybar.settings != { }) {
  #  text =
  #    builtins.replaceStrings [ "\\\\" ] [ "\\" ];
  #};  
}

