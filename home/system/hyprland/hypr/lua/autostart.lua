hl.on('hyprland.start', function()
  -- core services
  hl.exec_cmd('noctalia --daemon')
  hl.exec_cmd('wl-paste --watch cliphist store')
  hl.exec_cmd('fcitx5 -d')

  -- apps

  -- workspace 1: browser
  hl.dispatch(hl.dsp.exec_cmd('zen', { workspace = '1 silent' }))

  -- workspace 2: okular
  -- hl.dispatch(hl.dsp.exec_cmd('okular', { workspace = '2 silent' }))

  -- workspace 3: anki
  hl.dispatch(hl.dsp.exec_cmd('anki', { workspace = '3 silent' }))
  hl.dispatch(hl.dsp.exec_cmd('vesktop', { workspace = '3 silent' }))

  -- special workspace: spotify
  hl.dispatch(hl.dsp.exec_cmd('spotify', { workspace = 'special:etc silent' }))
end)
