{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.noctalia.nixosModules.default ];

  programs.hyprland.enable = true;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  programs = {
    thunar.enable = true;
    xfconf.enable = true;
  };
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  # # SDDM Configuration
  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  #   package = pkgs.kdePackages.sddm;
  #   theme = "catppuccin-mocha";
  # };
  #
  # # Install SDDM theme
  # environment.systemPackages = with pkgs; [
  #   catppuccin-sddm
  # ];

  services.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  security.pam.services.gdm-password.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  environment.systemPackages = [ pkgs.libsecret ];
  environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";
}
