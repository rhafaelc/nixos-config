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
  };
}
