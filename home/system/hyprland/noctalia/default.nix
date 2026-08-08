{
  inputs,
  config,
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
            "hyprland"
            "starship"
          ];

          community_ids = [
            "vscode"
            "neovim"
          ];

          user.tmux = {
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/tmux.conf";
            output_path = "$XDG_CONFIG_HOME/tmux/theme.conf";
            post_hook = "tmux source-file \${XDG_CONFIG_HOME:-$HOME/.config}/tmux/theme.conf";
          };

          user.satty = {
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/satty.toml";
            output_path = "$XDG_CONFIG_HOME/satty/config.toml";
          };
        };
      };

      wallpaper = {
        enabled = true;
        directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
        default.path = "${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.jpg";
      };

      hooks = {
        wallpaper_changed = "pkill -f thunar || true";
        colors_changed = "pkill -f thunar || true";
        theme_mode_changed = "pkill -f thunar || true";
      };

      idle = {
        pre_action_fade_seconds = 2.0;
        behavior = {
          dim = {
            enabled = true;
            timeout = 150;
            action = "command";
            command = "brightnessctl -s set 10";
            resume_command = "brightnessctl -r";
          };
          lock = {
            enabled = true;
            timeout = 300;
            action = "lock";
          };
          "screen-off" = {
            enabled = true;
            timeout = 330;
            action = "screen_off";
          };
          suspend = {
            enabled = true;
            timeout = 1800;
            action = "lock_and_suspend";
          };
        };
      };
    };
  };

  xdg.configFile = {
    "noctalia/templates/tmux.conf".source = ./templates/tmux.conf;
    "noctalia/templates/satty.toml".source = ./templates/satty.toml;
  };
}
