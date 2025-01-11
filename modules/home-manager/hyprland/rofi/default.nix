{ pkgs, config, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    
    # Main configuration
    terminal = "kitty";
    location = "center";
    
    # Theme configuration
    theme = lib.mkForce "catppuccin-mocha";
    
    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = false;
    };
  };

  # Only include theme files, not the main config
  xdg.configFile = {
    "rofi/themes/catppuccin-mocha.rasi".source = ./themes/catppuccin-mocha.rasi;
    "rofi/themes/launcher.rasi".source = ./themes/launcher.rasi;
    "rofi/themes/clipboard.rasi".source = ./themes/clipboard.rasi;
    "rofi/themes/screenshot.rasi".source = ./themes/screenshot.rasi;
  };
}
