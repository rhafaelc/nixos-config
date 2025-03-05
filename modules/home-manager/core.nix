{
  variables,
  lib,
  ...
}: {
  home = {
    username = lib.mkDefault variables.username;
    homeDirectory = lib.mkDefault "/home/${variables.username}";
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
