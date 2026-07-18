{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = [
    pkgs.ripgrep
  ];
	programs.neovim.enable = true;
}

