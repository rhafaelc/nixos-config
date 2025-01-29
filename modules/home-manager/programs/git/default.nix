{ pkgs, variables, ... }: {
  home.packages = [pkgs.gh];

  programs.gh.enable = true;
  programs.git = {
    enable = true;
    userName = variables.fullName;
    userEmail = variables.email;
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = ["*"];
    };
  };
  programs.lazygit = {
    enable = true;
  };
}
