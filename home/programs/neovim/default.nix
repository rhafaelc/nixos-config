{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings.vim = {
      viAlias = false;
      vimAlias = true;

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      autocomplete.blink-cmp.enable = true;
      treesitter.enable = true;

      languages = {
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

      telescope.enable = true;

      utility.oil-nvim.enable = true;

      keymaps = [
        {
          key = "<leader>pv";
          mode = "n";
          silent = true;
          action = ":Oil<CR>";
        }
      ];

      binds.whichKey.enable = true;

      git.gitsigns.enable = true;

      statusline.lualine.enable = true;

      autopairs.nvim-autopairs.enable = true;

      visuals.indent-blankline.enable = true;

      notes.todo-comments.enable = true;

      mini = {
        ai.enable = true;
        surround.enable = true;
      };

      # Noctalia-driven theming: base16-nvim + a hot-reloadable module Noctalia's
      # neovim community template writes to lua/matugen.lua at runtime.
      extraPlugins = {
        base16-nvim = {
          package = pkgs.vimPlugins.base16-nvim;
        };
      };

      luaConfigPost = ''
        local ok, matugen = pcall(require, 'matugen')
        if ok then matugen.setup() end

        local signal = vim.uv.new_signal()
        signal:start('sigusr1', vim.schedule_wrap(function()
          package.loaded['matugen'] = nil
          local reload_ok, m = pcall(require, 'matugen')
          if reload_ok then m.setup() end
        end))
      '';
    };
  };
}
