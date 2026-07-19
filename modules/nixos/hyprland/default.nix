{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
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

  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
}
