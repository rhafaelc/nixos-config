{
  pkgs,
  inputs,
  ...
}: 
let
  idea = "idea-community";
  ideaPlugins = inputs.nix-jetbrains-plugins.plugins."x86_64-linux"."${idea}"."2024.3";
  pluginList = [
    ideaPlugins."com.github.catppuccin.jetbrains"
    ideaPlugins."com.github.catppuccin.jetbrains_icons"
  ];
in {
  home.packages = [
    # pkgs.jetbrains.idea-community
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains."${idea}" pluginList)
  ];
}
