{
  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/system/terminal
    ../../home/system/shells
    ../../home/system/hyprland
    ../../home/system/themes
  ];

  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../../home/wallpapers;
    recursive = true;
  };
}
