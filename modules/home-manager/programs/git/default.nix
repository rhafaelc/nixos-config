{ 
  pkgs, 
  ... 
}: {
  home.packages = [pkgs.gh];

  programs.gh.enable = true;
  programs.git = {
    enable = true;
    userName = "Rhafael Chandra";
    userEmail = "rhafaelchandra@gmail.com";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = ["*"];
    };
  };
}
