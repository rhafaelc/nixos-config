{ lib, ... }: {
  programs = {
    bat.enable = true;

    ghostty = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        theme = "noctalia";
        font-family = lib.mkForce "JetBrainsMonoNL Nerd Font Regular";
        font-feature = [
          "-calt"
          "-liga"
          "-dlig"
        ];
        auto-update = "off";
        confirm-close-surface = false;
        window-padding-x = 4;
        window-padding-y = 4;
        font-size = lib.mkForce 12;
        shell-integration = lib.mkForce "fish";
        gtk-titlebar = false;
      };
    };
  };
}
