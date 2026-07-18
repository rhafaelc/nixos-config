{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # Theme-related
    font-awesome
    nerd-fonts.jetbrains-mono

    # Audio
    playerctl # Media player control
    pwvucontrol

    # Brightness
    brightnessctl

    # Screenshots/Recording
    grim # Screenshot tool
    slurp # Screen area selection
    satty # Screenshot annotation tool

    # Utils
    wl-clipboard # Clipboard
    cliphist # Clipboard history

    # File management
    thunar # File manager

    # Image viewing
    qimgv # Image viewer

    kitty
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = /* lua */ ''
hl.curve('snap', {
  type = 'bezier',
  points = {
    { 0.5, 1.0 },
    { 0.2, 1.0 },
  },
})

hl.curve('snap2', {
  type = 'bezier',
  points = {
    { 0.5, 1.0 },
    { 0.25, 1.0 },
  },
})

hl.animation {
  leaf = 'global',
  enabled = true,
  speed = 0.7,
  bezier = 'snap',
}

hl.animation {
  leaf = 'border',
  enabled = true,
  speed = 0.7,
  bezier = 'snap',
}

hl.animation {
  leaf = 'windows',
  enabled = true,
  speed = 0.7,
  bezier = 'snap2',
}

hl.animation {
  leaf = 'windowsIn',
  enabled = true,
  speed = 0.65,
  bezier = 'snap2',
  style = 'popin 95%',
}

hl.animation {
  leaf = 'windowsOut',
  enabled = true,
  speed = 0.65,
  bezier = 'snap2',
  style = 'popin 70%',
}

hl.animation {
  leaf = 'fadeIn',
  enabled = true,
  speed = 0.7,
  bezier = 'snap',
}

hl.animation {
  leaf = 'fadeOut',
  enabled = true,
  speed = 0.7,
  bezier = 'snap',
}

hl.animation {
  leaf = 'workspaces',
  enabled = true,
  speed = 0.7,
  bezier = 'snap',
  style = 'slide',
}

hl.animation {
  leaf = 'layers',
  enabled = true,
  speed = 0.7,
  bezier = 'snap',
}

hl.on('hyprland.start', function()
  -- core services
  hl.exec_cmd('noctalia --daemon')
  hl.exec_cmd('wl-paste --watch cliphist store')

  -- apps

  -- workspace 1: browser
  hl.exec_cmd('hyprctl dispatch exec "[workspace 1 silent] zen"')

  -- workspace 2: okular
  -- hl.exec_cmd('hyprctl dispatch exec "[workspace 2 silent] okular"')

  -- workspace 3: anki
  hl.exec_cmd('hyprctl dispatch exec "[workspace 3 silent] anki"')
  hl.exec_cmd('hyprctl dispatch exec "[workspace 3 silent] vesktop"')

  -- special workspace: spotify
  hl.exec_cmd('hyprctl dispatch exec "[workspace special:etc silent] spotify"')
end)

hl.config {
  listener = {
    {
      timeout = 150, -- 2.5 min
      on_timeout = 'brightnessctl -s set 10',
      on_resume = 'brightnessctl -r',
    },

    -- Uncomment if you have keyboard backlight
    -- {
    --   timeout = 150,
    --   on_timeout = 'brightnessctl -sd rgb:kbd_backlight set 0',
    --   on_resume = 'brightnessctl -rd rgb:kbd_backlight',
    -- },

    {
      timeout = 300, -- 5 min
      on_timeout = 'loginctl lock-session',
    },

    {
      timeout = 330, -- 5.5 min
      on_timeout = 'hyprctl dispatch dpms off',
      on_resume = 'hyprctl dispatch dpms on',
    },

    {
      timeout = 1800, -- 30 min
      on_timeout = 'systemctl suspend',
    },
  },
}

hl.config {
  misc = {
    disable_hyprland_logo = true,
    enable_swallow = false,
  },
}

hl.config {
  input = {
    kb_layout = 'us',
    touchpad = {
      natural_scroll = true,
      disable_while_typing = false,
    },
  },
}

hl.gesture {
  fingers = 4,
  direction = 'horizontal',
  action = 'workspace',
}

hl.gesture({
  fingers = 3,
  direction = 'right',
  action = function()
    hl.dispatch(hl.dsp.focus({ direction = 'left' }))
  end,
})

hl.gesture({
  fingers = 3,
  direction = 'left',
  action = function()
    hl.dispatch(hl.dsp.focus({ direction = 'right' }))
  end,
})


local mainMod = 'SUPER'

local terminal = 'ghostty'

local fileManager = 'thunar'

hl.bind(mainMod .. ' + ' .. 'RETURN', hl.dsp.exec_cmd 'ghostty')

hl.bind(mainMod .. ' + ' .. 'R', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call launcher toggle')

hl.bind(mainMod .. ' + ' .. 'E', hl.dsp.exec_cmd 'thunar')

hl.bind(mainMod .. ' + ' .. 'Q', hl.dsp.window.close())

hl.bind('ALT' .. ' + ' .. 'F4', hl.dsp.window.close())

hl.bind(
  mainMod .. ' + SHIFT + S',
  hl.dsp.exec_cmd "grim -g \"$(slurp -o -r -c '##ff0000ff')\" -t png - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
)

hl.bind(mainMod .. ' + CTRL + Q', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call lockScreen lock')

hl.bind(mainMod .. ' + ' .. 'CTRL' .. ' + ' .. 'LEFT', hl.dsp.focus { workspace = 'e-1' })

hl.bind(mainMod .. ' + ' .. 'CTRL' .. ' + ' .. 'RIGHT', hl.dsp.focus { workspace = 'e+1' })

hl.bind(mainMod .. ' + ' .. 'F', hl.dsp.window.fullscreen())

-- Media controls

hl.bind('XF86AudioPlay', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call media playPause', { locked = true })

hl.bind('XF86AudioPause', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call media playPause', { locked = true })

hl.bind('XF86AudioNext', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call media next', { locked = true })

hl.bind('XF86AudioPrev', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call media previous', { locked = true })

-- Volume

hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call volume increase', { locked = true })

hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call volume decrease', { locked = true })

hl.bind('XF86AudioMute', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call volume muteOutput', { locked = true })

-- Brightness

hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call brightness increase', { locked = true })

hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call brightness decrease', { locked = true })

for i = 1, 9 do
  hl.bind(
    mainMod .. ' + ' .. tostring(i),
    hl.dsp.focus {
      workspace = tostring(i),
    }
  )

  hl.bind(
    mainMod .. ' + SHIFT + ' .. tostring(i),
    hl.dsp.window.move {
      workspace = tostring(i),
    }
  )
end

-- numbered workspaces

for i = 1, 9 do
  -- switch workspace
  hl.bind(
    mainMod .. ' + ' .. tostring(i),
    hl.dsp.focus {
      workspace = tostring(i),
    }
  )

  -- move focused window to workspace
  hl.bind(
    mainMod .. ' + SHIFT + ' .. tostring(i),
    hl.dsp.window.move {
      workspace = tostring(i),
    }
  )
end

-- special workspace bindings

hl.bind(mainMod .. ' + ' .. 'U', hl.dsp.workspace.toggle_special 'etc')

hl.bind(
  mainMod .. ' + ' .. 'SHIFT' .. ' + ' .. 'U',
  hl.dsp.window.move {
    workspace = 'special:etc',
  }
)

hl.bind('ALT + TAB', hl.dsp.window.cycle_next())

hl.bind(mainMod .. ' + ' .. 'V', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call launcher clipboard')

hl.bind(mainMod .. ' + ' .. 'PERIOD', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call launcher emoji')

hl.bind(mainMod .. ' + ' .. 'COMMA', hl.dsp.exec_cmd 'qs -c noctalia-shell ipc call settings toggle')

hl.bind(mainMod .. ' + ' .. 'mouse:272', hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. ' + ' .. 'mouse:273', hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. ' + ' .. 'CTRL' .. ' + ' .. 'mouse:272', hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. ' + ' .. 'mouse_down', hl.dsp.focus { workspace = 'e+1' })

hl.bind(mainMod .. ' + ' .. 'mouse_up', hl.dsp.focus { workspace = 'e-1' })

hl.bind(mainMod .. ' + TAB', function() hl.exec_cmd [[hyprctl eval "hl.config({ general = { layout = 'scrolling' } })"]] end)

hl.bind(mainMod .. ' + SHIFT + TAB', function() hl.exec_cmd [[hyprctl eval "hl.config({ general = { layout = 'dwindle' } })"]] end)

hl.bind(mainMod .. ' + H', hl.dsp.focus { direction = 'left' })
hl.bind(mainMod .. ' + L', hl.dsp.focus { direction = 'right' })
hl.bind(mainMod .. ' + K', hl.dsp.focus { direction = 'up' })
hl.bind(mainMod .. ' + J', hl.dsp.focus { direction = 'down' })

hl.monitor {
  output = 'eDP-1',
  mode = 'preferred',
  position = '0x0',
  scale = 1,
  bitdepth = 8,
}

for i = 1, 10 do
  hl.workspace_rule {
    workspace = i,
    monitor = 'eDP-1',
    persistent = (i <= 5),
  }
end

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

hl.layer_rule {
  match = {
    namespace = 'noctalia-background-.*$',
  },
  ignore_alpha = 0.1,
  blur = true,
  blur_popups = true,
}

    '';
  };
}
