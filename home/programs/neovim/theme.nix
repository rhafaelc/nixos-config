{ pkgs, ... }: {
  vim = {
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
}
