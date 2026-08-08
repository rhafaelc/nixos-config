{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    # Theme-related
    font-awesome
    nerd-fonts.jetbrains-mono

    # Audio
    playerctl # Media player control
    pwvucontrol

    # Brightness
    brightnessctl

    # Screenshots/Recording
    grim # Screenshot tool
    slurp # Screen area selection
    satty # Screenshot annotation tool

    # Utils
    wl-clipboard # Clipboard
    cliphist # Clipboard history

    # File management
    thunar # File manager

    # Image viewing
    qimgv # Image viewer
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraLuaFiles = {
      variables = {
        content = ./lua/variables.lua;
        autoLoad = false;
      };
      animations.content = ./lua/animations.lua;
      autostart.content = ./lua/autostart.lua;
      idle.content = ./lua/idle.lua;
      general.content = ./lua/general.lua;
      input.content = ./lua/input.lua;
      keybinds.content = ./lua/keybinds.lua;
      monitors.content = ./lua/monitors.lua;
      rules.content = ./lua/rules.lua;
      noctalia-colors.content = ./lua/noctalia-colors.lua;
    };
  };
}
