{
  pkgs,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = {
      name = "adawaita";
    };
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme; 
    };
  };
}
