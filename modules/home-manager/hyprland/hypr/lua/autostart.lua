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
