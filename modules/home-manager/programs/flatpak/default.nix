{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
  services.flatpak.packages = [
    # {
    #   appId = "org.vinegarhq.Sober";
    #   origin = "flathub";
    # }
    # {
    #   appId = "org.vinegarhq.Vinegar";
    #   origin = "flathub";
    # }
  ];
}
