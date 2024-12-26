{
  pkgs,
  inputs,
  ...
}:
let
  system = "x86_64-linux";
in {
  home.packages = [
    # pkgs.vim
    pkgs.nerd-fonts.jetbrains-mono

    pkgs.ags
    pkgs.networkmanager
    pkgs.libgtop
    pkgs.wl-clipboard
    pkgs.bluez
    pkgs.dart-sass
    pkgs.gnome-bluetooth


    inputs.hyprpanel.packages."${system}".default
  ];
}
