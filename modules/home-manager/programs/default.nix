{
  imports = [
    ./git
    ./spotify
    ./vscode
    ./zen-browser
    ./vesktop
    ./fastfetch
    ./neovim
    ./vlc
    ./jetbrains
    ./postman
    ./devbox
  ];

  programs.lazydocker = {
    enable = true;
  };
}
