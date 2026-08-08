{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
      };

      wallpaper = {
        enabled = true;
        default.path = "${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.jpg";
      };
    };
  };

}
