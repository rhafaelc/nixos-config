{
  lib,
  config,
  ...
}: {
  programs.rofi = {
    enable = true;
    # font = lib.mkForce "JetBrainsMono Nerd Font";
    theme = lib.mkForce ./catppuccin-mocha.rasi;
    extraConfig = {
      display-drun= "Applications:";
      display-window= "Windows:";
      drun-display-format= "{icon} {name}";
      font= "JetBrainsMono Nerd Font Medium 10";
      modi= "window,run,drun";
      show-icons= true;
    };
  };
}
