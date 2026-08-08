{ pkgs, ... }: {
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;

      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-configtool
        fcitx5-mozc
      ];

      settings = {
        globalOptions."Hotkey" = {
          EnumerateWithTriggerKeys = true;
          EnumerateGroupForwardKeys = "Super+space";
        };

        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0" = {
            Name = "keyboard-us";
            Layout = "";
          };
          "Groups/0/Items/1" = {
            Name = "mozc";
            Layout = "";
          };
          GroupOrder."0" = "Default";
        };
      };
    };
  };
}
