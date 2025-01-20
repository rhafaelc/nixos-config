{lib, ...}: {
  programs = {
    bat.enable = true;

    ghostty = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        font-family = lib.mkForce "JetBrainsMonoNL Nerd Font Regular";
        auto-update = "off";
        confirm-close-surface = false;
        window-padding-x = 4;
        window-padding-y = 4;
        font-size = lib.mkForce 12;
        shell-integration = lib.mkForce "zsh";
        gtk-titlebar = false;
      };
    };
  };
}
