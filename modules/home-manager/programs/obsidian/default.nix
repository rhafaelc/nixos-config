{pkgs, ...}: let
  gitSyncObsidian = pkgs.writeScriptBin "git-sync-obisidian" ''
    #!/bin/sh

    VAULT_DIR="$HOME/PARA"

    cd $VAULT_DIR || exit 1

    git add .

    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0

    git pull --rebase origin master || exit 0

    git push origin master
  '';
in {
  home.packages = [gitSyncObsidian];

  systemd.user.services.git-sync-obisidian = {
    Unit = {
      Description = "Sync Obsidian Vault with GitHub";
      Wants = "git-sync-obisidian.timer";
    };
    Service = {
      ExecStart = "${gitSyncObsidian}/bin/git-sync-obisidian";
      Type = "simple";
    };
  };

  systemd.user.timers.git-sync-obisidian = {
    Unit.Description = "Run Git Sync for Obsidian Vault";
    Timer.OnCalendar = "*:0/15";
    Install.WantedBy = ["timers.target"];
  };
}
