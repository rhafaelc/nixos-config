{
  config,
  pkgs-unstable,
  ...
}: {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
