local vars = require('variables')
local mainMod = vars.mainMod
local terminal = vars.terminal
local fileManager = vars.fileManager

hl.bind(mainMod .. ' + ' .. 'RETURN', hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. ' + ' .. 'R', hl.dsp.exec_cmd 'noctalia msg panel-toggle launcher')

hl.bind(mainMod .. ' + ' .. 'E', hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. ' + ' .. 'Q', hl.dsp.window.close())

hl.bind('ALT' .. ' + ' .. 'F4', hl.dsp.window.close())

hl.bind(
  mainMod .. ' + SHIFT + S',
  hl.dsp.exec_cmd "grim -g \"$(slurp -o -r -c '##ff0000ff')\" -t png - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
)

hl.bind(mainMod .. ' + CTRL + Q', hl.dsp.exec_cmd 'noctalia msg session lock')

hl.bind(mainMod .. ' + ' .. 'CTRL' .. ' + ' .. 'LEFT', hl.dsp.focus { workspace = 'e-1' })

hl.bind(mainMod .. ' + ' .. 'CTRL' .. ' + ' .. 'RIGHT', hl.dsp.focus { workspace = 'e+1' })

hl.bind(mainMod .. ' + ' .. 'F', hl.dsp.window.fullscreen())

-- Media controls

hl.bind('XF86AudioPlay', hl.dsp.exec_cmd 'noctalia msg media toggle', { locked = true })

hl.bind('XF86AudioPause', hl.dsp.exec_cmd 'noctalia msg media toggle', { locked = true })

hl.bind('XF86AudioNext', hl.dsp.exec_cmd 'noctalia msg media next', { locked = true })

hl.bind('XF86AudioPrev', hl.dsp.exec_cmd 'noctalia msg media previous', { locked = true })

-- Volume

hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd 'noctalia msg volume-up', { locked = true })

hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd 'noctalia msg volume-down', { locked = true })

hl.bind('XF86AudioMute', hl.dsp.exec_cmd 'noctalia msg volume-mute', { locked = true })

-- Brightness

hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd 'noctalia msg brightness-up', { locked = true })

hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd 'noctalia msg brightness-down', { locked = true })

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

hl.bind(mainMod .. ' + ' .. 'V', hl.dsp.exec_cmd 'noctalia msg panel-toggle clipboard')

hl.bind(mainMod .. ' + ' .. 'PERIOD', hl.dsp.exec_cmd 'noctalia msg panel-toggle launcher /emo')

hl.bind(mainMod .. ' + ' .. 'COMMA', hl.dsp.exec_cmd 'noctalia msg settings-toggle')

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
