{ ... }: {
  vim.languages = {
    nix = {
      enable = true;
      lsp.servers = [ "nixd" ];
      format.type = [ "nixfmt" ];
    };
    lua.enable = true;
    clang.enable = true;
    python = {
      enable = true;
      format.type = [ "ruff" ];
    };
    typescript.enable = true;
    go = {
      enable = true;
      format.enable = true;
    };
  };
}
