{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = false;
  };

  home.packages = [ pkgs.rofi-wayland ];

  xdg.configFile = {
    "rofi/config.rasi".source = ./config.rasi;
    "rofi/themes/catppuccin-mocha.rasi".source = ./themes/catppuccin-mocha.rasi;
    "rofi/themes/launcher.rasi".source = ./themes/launcher.rasi;
    "rofi/themes/clipboard.rasi".source = ./themes/clipboard.rasi;
    "rofi/themes/screenshot.rasi".source = ./themes/screenshot.rasi;
  };
}
