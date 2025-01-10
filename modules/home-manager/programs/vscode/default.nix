{ 
  pkgs,
  lib,
  ...
}:{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      catppuccin.catppuccin-vsc-icons
      catppuccin.catppuccin-vsc
      github.copilot
      github.copilot-chat
      eamodio.gitlens
    ];

    userSettings = {
      "workbench.iconTheme"= "catppuccin-mocha";
      "workbench.colorTheme"= lib.mkForce "Catppuccin Mocha";
      "editor.fontFamily"= lib.mkForce "JetBrainsMono Nerd Font";
      "terminal.integrated.fontFamily"= lib.mkForce "JetBrainsMono Nerd Font";
    };
  };
}
