{
  pkgs,
  ...
}: {
  stylix.targets.vesktop.enable = true;
  home.packages = [pkgs.vesktop];
}
