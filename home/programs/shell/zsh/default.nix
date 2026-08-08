{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    # disable ctrl-s/ctrl-q terminal flow control so tmux's C-s prefix
    # actually reaches tmux instead of freezing the terminal
    initContent = ''
      stty -ixon
    '';
  };
}
