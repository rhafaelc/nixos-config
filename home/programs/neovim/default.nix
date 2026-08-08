{ inputs, ... }: {
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings.imports = [
      ./options.nix
      ./languages.nix
      ./ui.nix
      ./git.nix
      ./theme.nix
      ./keymaps.nix
    ];
  };
}
