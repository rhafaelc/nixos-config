{
  inputs,
  config,
  lib,
  ...
}:
{
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

        templates = {
          enable_builtin_templates = true;
          builtin_ids = [
            "gtk3"
            "gtk4"
            "qt"
            "ghostty"
          ];

          community_ids = [
            "vscode"
            "neovim"
          ];

          user.tmux = {
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/tmux.conf";
            output_path = "$XDG_CONFIG_HOME/tmux/theme.conf";
            post_hook = "tmux source-file $XDG_CONFIG_HOME/tmux/theme.conf";
          };
        };
      };

      wallpaper = {
        enabled = true;
        directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
        default.path = "${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.jpg";
      };
    };
  };

  xdg.configFile."noctalia/templates/tmux.conf".source = ./templates/tmux.conf;
}
