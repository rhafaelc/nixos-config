{
  pkgs,
  lib,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = {
      name = lib.mkForce "adawaita";
    };
    # style = {
    #   name = "adwaita-dark";
    #   package = pkgs.adwaita-qt;
    # };
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
