{ ... }: {
  vim = {
    telescope.enable = true;

    utility.oil-nvim.enable = true;

    binds.whichKey.enable = true;

    statusline.lualine.enable = true;

    autopairs.nvim-autopairs.enable = true;

    visuals.indent-blankline.enable = true;

    notes.todo-comments.enable = true;

    mini = {
      ai.enable = true;
      surround.enable = true;
    };
  };
}
