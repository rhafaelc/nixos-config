{lib, ...}: {
  programs.waybar = {
    enable = true;
  };

  xdg.configFile = {
    "waybar/config.jsonc".source = ./config.jsonc;
    "waybar/style.css".source = lib.mkForce ./style.css;
    "waybar/mocha.css".source = ./mocha.css;
  };
}
