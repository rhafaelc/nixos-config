{ ... }: {
  vim.keymaps = [
    {
      key = "<leader>pv";
      mode = "n";
      silent = true;
      action = ":Oil<CR>";
    }
  ];
}
