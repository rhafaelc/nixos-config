{
  lib,
  pkgs,
  ...
}:
###########################################################
#
# Kitty Configuration
#
# Useful Hot Keys for Linux(replace `ctrl + shift` with `cmd` on macOS)):
#   1. Increase Font Size: `ctrl + shift + =` | `ctrl + shift + +`
#   2. Decrease Font Size: `ctrl + shift + -` | `ctrl + shift + _`
#   3. And Other common shortcuts such as Copy, Paste, Cursor Move, etc.
#
###########################################################
{
  programs.kitty = {
    enable = true;
    # kitty has catppuccin theme built-in,
    # all the built-in themes are packaged into an extra package named `kitty-themes`
    # and it's installed by home-manager if `theme` is specified.
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "JetBrainsMono Nerd Font";
    };

    settings = {
      background_opacity = "0.93";
      shell = "${pkgs.bash}/bin/bash --login -c 'nu --login --interactive'";
    };
  };
}
