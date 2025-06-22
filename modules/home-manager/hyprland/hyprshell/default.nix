{inputs, ...}: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];
  programs.hyprshell = {
    enable = true;
    systemd.args = "-v";
    settings = {
      windows.overview = {
        launcher = {
          default_terminal = "ghostty";
          max_items = 6;
          plugins = {
            terminal.enable = false;
            websearch.enable = false;
          };
        };
      };
      windows.switch = {
        enable = true;
        filter_by = ["current_workspace"];
      };
    };
  };
}
