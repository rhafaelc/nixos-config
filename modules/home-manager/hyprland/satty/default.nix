{
  xdg.configFile."satty/config.toml".text = ''
    [general]
    fullscreen = true
    early-exit = true
    corner-roundness = 12
    initial-tool = "brush"
    copy-command = "wl-copy"
    annotation-size-factor = 2
    output-filename = "~/Pictures/Screenshots/satty-%Y-%m-%d_%H:%M:%S.png"
    action-on-enter = "save-to-clipboard"
    save-after-copy = false
    default-hide-toolbars = false
    primary-highlighter = "block"
    disable-notifications = false

    [font]
    family = "JetBrainsMono Nerd Font"
    style = "Bold"

    [color-palette]
    palette = [
      "#89b4fa",  # Catppuccin blue
      "#f38ba8",  # Catppuccin red
      "#a6e3a1",  # Catppuccin green
      "#fab387",  # Catppuccin peach
      "#f9e2af",  # Catppuccin yellow
      "#cba6f7",  # Catppuccin mauve
    ]
  '';
} 