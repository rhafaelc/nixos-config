{ ... }: {
  vim = {
    viAlias = false;
    vimAlias = true;

    options = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      cursorline = true;
      confirm = true;

      undofile = true;

      ignorecase = true;
      smartcase = true;

      splitright = true;
      splitbelow = true;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;

      breakindent = true;

      updatetime = 250;
      timeoutlen = 300;

      signcolumn = "yes:1";
      scrolloff = 10;
      sidescrolloff = 8;
      colorcolumn = "80";

      list = true;
      listchars = "tab:» ,trail:·,nbsp:␣";

      inccommand = "split";

      clipboard = "unnamedplus";
    };

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

    # Language-specific indentation
    luaConfigRC.indentation = ''
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "nix",
          "lua",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        callback = function()
          vim.bo.tabstop = 2
          vim.bo.shiftwidth = 2
          vim.bo.softtabstop = 2
          vim.bo.expandtab = true
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "python",
        },
        callback = function()
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.softtabstop = 4
          vim.bo.expandtab = true
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function()
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.softtabstop = 4
          vim.bo.expandtab = false
        end,
      })
    '';
  };
}
