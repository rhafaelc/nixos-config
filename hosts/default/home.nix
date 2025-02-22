{
  imports = [
    ../../modules/home-manager/core.nix

    ../../modules/home-manager/programs
    ../../modules/home-manager/terminal
    ../../modules/home-manager/shells
    ../../modules/home-manager/hyprland
    # ../../modules/home-manager/themes
  ];

  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../../modules/home-manager/wallpapers;
    recursive = true;
  };
  home.file.".config/wlogout/icons" = {
    source = ../../modules/home-manager/hyprland/wlogout/icons;
    recursive = true;
  };
}
