{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    prefix = "C-s";
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -g status-position top
      set -sg escape-time 10
    '';


    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          
          set -g @catppuccin_window_status_style "basic"
          set -ogq @catppuccin_window_default_text " #W"
          set -ogq @catppuccin_window_current_text " #W"

          set -g @catppuccin_status_modules_right "directory host session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
    ];
  };
}
