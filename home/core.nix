{
  variables,
  lib,
  ...
}:
{
  home = {
    username = lib.mkDefault variables.username;
    homeDirectory = lib.mkDefault "/home/${variables.username}";
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
