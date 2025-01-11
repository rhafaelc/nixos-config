{ config, variables, ... }: {
  home = {
    username = variables.username;
    homeDirectory = "/home/${variables.username}";
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
