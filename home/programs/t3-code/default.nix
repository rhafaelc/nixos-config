{ pkgs, ... }: {
  home.packages = [
    pkgs.codex
  ];
  programs.t3code.enable = true;

}
