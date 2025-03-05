{ pkgs, ... } : {
  stylix = {
    enable = true;
    
    # Disable specific application theming
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    
    # Define the color scheme
    # base16Scheme = {
    #   base00 = "1e1e2e"; # base
    #   base01 = "181825"; # mantle
    #   base02 = "313244"; # surface0
    #   base03 = "45475a"; # surface1
    #   base04 = "585b70"; # surface2
    #   base05 = "cdd6f4"; # text
    #   base06 = "f5e0dc"; # rosewater
    #   base07 = "b4befe"; # lavender
    #   base08 = "f38ba8"; # red
    #   base09 = "fab387"; # peach
    #   base0A = "f9e2af"; # yellow
    #   base0B = "a6e3a1"; # green
    #   base0C = "94e2d5"; # teal
    #   base0D = "89b4fa"; # blue
    #   base0E = "cba6f7"; # mauve
    #   base0F = "f2cdcd"; # flamingo
    # };

    # Set wallpaper
    image = ../../../home-manager/wallpapers/wallpaper.jpg;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      serif = {
        package = pkgs.crimson;
        name = "Crimson";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        desktop = 11;
        applications = 11;
        terminal = 12;     # Slightly larger for better readability
        popups = 11;
      };
    };
  };
}
