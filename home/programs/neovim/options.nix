{ ... }: {
  vim = {
    viAlias = false;
    vimAlias = true;

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    autocomplete.blink-cmp.enable = true;
    treesitter.enable = true;

    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers.wl-copy = {
        enable = true;
        package = null;
      };
    };
  };
}
