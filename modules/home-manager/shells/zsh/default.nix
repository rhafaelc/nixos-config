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

    initContent = ''
      export TERM=xterm-256color

      # Run N instances in separate prefixes, each on its own virtual desktop
      ro-run() {
        local n="''\${1:-2}"                   # how many instances
        local game="$HOME/Games/Ragnarok"      # game dir
        local exe="ro_win.exe"                 # entrypoint
        local res="''\${2:-1280x720}"          # desktop resolution

        [[ -f "$game/$exe" ]] || { echo "Missing $game/$exe"; return 1; }

        for i in $(seq 1 "$n"); do
          ( WINEPREFIX="$game/prefix-$i"; cd "$game" \
            && wine explorer "/desktop=Rag''\${i},''\${res}" "./$exe" ) &
        done
      }

      # Stop all instances (kills wineserver for prefix-1..32)
      ro-stop() {
        local game="$HOME/Games/Ragnarok"
        for i in $(seq 1 32); do
          WINEPREFIX="$game/prefix-''\${i}" wineserver -k 2>/dev/null || true
        done
      }
    '';
  };
}
