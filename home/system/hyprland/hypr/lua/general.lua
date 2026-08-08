hl.config {
  misc = {
    disable_hyprland_logo = true,
    enable_swallow = false,
  },
}

hl.config {
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,
    resize_on_border = false,
    allow_tearing = false,
    layout = 'scrolling',
  },
}

-- --- decoration ---

hl.config {
  decoration = {
    rounding = 10,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.15,
    },
  },
}

hl.config {
  dwindle = {
    preserve_split = true,
  },
}

hl.config {
  master = {
    new_status = 'master',
  },
}

hl.config {
  scrolling = {
    fullscreen_on_one_column = true,
    column_width = 0.7,
    direction = 'right',
  },
}
