{ pkgs, variables, ... }: {
  home.packages = [ pkgs.gh ];

  programs.gh.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = variables.fullName;
        email = variables.email;
      };
      init.defaultBranch = "main";
      safe.directory = [ "*" ];
    };
  };
}
