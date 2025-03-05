{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      catppuccin.catppuccin-vsc-icons
      catppuccin.catppuccin-vsc
      github.copilot
      github.copilot-chat
      eamodio.gitlens

      esbenp.prettier-vscode
      yoavbls.pretty-ts-errors
      dbaeumer.vscode-eslint
      wix.vscode-import-cost
      bradlc.vscode-tailwindcss

      wakatime.vscode-wakatime
    ];

    profiles.default.userSettings = {
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = lib.mkForce "Catppuccin Mocha";
      "editor.fontFamily" = lib.mkForce "JetBrainsMono Nerd Font";
      "terminal.integrated.fontFamily" = lib.mkForce "JetBrainsMono Nerd Font";

      "prettier.printWidth" = 80;
      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.bracketPairColorization.enabled" = true;
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "editor.guides.bracketPairs" = true;

      "explorer.compactFolders" = false;
      "window.titleBarStyle" = "custom";
    };
  };
}
