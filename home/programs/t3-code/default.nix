{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.codex
  ];
  programs.t3code.enable = true;

  # The package's `t3` command starts the browser-based server.
  home.shellAliases = {
    t3 = lib.getExe config.programs.t3code.package;
    t3-server = "${config.programs.t3code.package}/bin/t3";
  };

  xdg.desktopEntries.t3code = {
    name = "T3 Code (Alpha)";
    exec = "${lib.getExe config.programs.t3code.package} %U";
    icon = "t3code";
    terminal = false;
    categories = [ "Development" ];
    mimeType = [ "x-scheme-handler/t3code" ];
    settings.StartupWMClass = "t3code";
  };

  # Register the launcher without replacing other application associations.
  home.activation.t3codeProtocolHandler = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    run ${pkgs.xdg-utils}/bin/xdg-mime default t3code.desktop x-scheme-handler/t3code
  '';
}
