{pkgs, ...}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    # settings = pkgs.lib.importTOML ./starship.toml;
  };
}
