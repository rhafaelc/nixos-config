{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    prefix = "C-s";
    mouse = true;
    terminal = "tmux-256color";
    historyLimit = 50000;
    extraConfig = ''
      set-option -g status-position top
      set -sg escape-time 10
      set -g base-index 1
      setw -g pane-base-index 1
      set-option -g status-style bg=default
      set -g pane-border-style fg=default,bg=default
      set -g window-style fg=default,bg=default
      set -g window-active-style fg=default,bg=default

      set -g renumber-windows on
      set -g detach-on-destroy on
      set -ga terminal-overrides ",*256col*:Tc"
      setw -g window-status-separator ""
      setw -g monitor-activity on
      set -g visual-activity off
      set -g focus-events on

      source-file ~/.config/tmux/theme.conf

      # Better window splitting
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Easy config reload
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"

      # Resize panes with vim keys
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Copy mode bindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

      # Synchronize panes
      bind S setw synchronize-panes

      # Clear screen and history
      bind C-l send-keys 'C-l' \; clear-history
    '';

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = "";
      }
    ];
  };
}
