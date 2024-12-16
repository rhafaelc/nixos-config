{
  ...
}: {
  programs.waybar.style = ''
    * {
      /* https://docs.gtk.org/gtk3/css-overview.html#colors */
      color: @text;
      font-family: "JetBrainsMono Nerd Font";
      font-size: 12pt;
      font-weight: bold;
      border-radius: 8px;
      transition-property: background-color;
      transition-duration: 0.5s;
    }
    @keyframes blink_red {
      to {
        background-color: rgb(242, 143, 173);
        color: rgb(26, 24, 38);
      }
    }
    .warning,
    .critical,
    .urgent {
      animation-name: blink_red;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }
    window#waybar {
      background-color: transparent;
      border: 2px solid alpha(@crust, 0.3);
    }
    window > box {
      margin-left: 5px;
      margin-right: 5px;
      margin-top: 5px;
      background-color: shade(@base, 0.9);
      padding: 3px;
      padding-left: 8px;
      border: 2px none #33ccff;
    }
    #workspaces {
      padding-left: 0px;
      padding-right: 4px;
    }
    #workspaces button {
      padding-top: 5px;
      padding-bottom: 5px;
      padding-left: 6px;
      padding-right: 6px;
    }
    #workspaces button.active {
      background-color: rgb(181, 232, 224);
      color: rgb(26, 24, 38);
    }
    #workspaces button.urgent {
      color: rgb(26, 24, 38);
    }
    #workspaces button:hover {
      background-color: rgb(248, 189, 150);
      color: rgb(26, 24, 38);
    }
    tooltip {
      background: rgb(48, 45, 65);
    }
    tooltip label {
      color: rgb(217, 224, 238);
    }
    #custom-launcher {
      font-size: 20px;
      padding-left: 8px;
      padding-right: 6px;
      color: #7ebae4;
    }
    #mode,
    #clock,
    #memory,
    #temperature,
    #cpu,
    #mpd,
    #custom-wall,
    #temperature,
    #backlight,
    #pulseaudio,
    #network,
    #battery,
    #custom-powermenu {
      padding-left: 10px;
      padding-right: 10px;
    }

    /* #mode { */
    /* 	margin-left: 10px; */
    /* 	background-color: rgb(248, 189, 150); */
    /*     color: rgb(26, 24, 38); */
    /* } */
    #memory {
      color: rgb(181, 232, 224);
    }
    #cpu {
      color: rgb(245, 194, 231);
    }
    #clock {
      color: rgb(217, 224, 238);
    }

    #idle_inhibitor {
      color: rgb(221, 182, 242);
      padding-right: 8px;
    }
    #battery {
      min-width: 55px;
      color: rgb(126, 186, 244);
    }
    #battery.charging,
    #battery.full,
    #battery.plugged {
      color: #26a65b;
    }
    #battery.critical:not(.charging) {
      color: #f53c3c;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }
    #custom-wall {
      color: #33ccff;
    }
    #temperature {
      color: rgb(150, 205, 251);
    }
    #backlight {
      color: rgb(248, 189, 150);
    }
    #pulseaudio {
      color: rgb(245, 224, 220);
    }
    #network {
      color: #abe9b3;
    }
    #network.disconnected {
      color: rgb(255, 255, 255);
    }
    #custom-powermenu {
      color: rgb(242, 143, 173);
      padding-right: 8px;
    }
    #tray {
      padding-right: 8px;
      padding-left: 10px;
    }
    #mpd.paused {
      color: #414868;
      font-style: italic;
    }
    #mpd.stopped {
      background: transparent;
    }
    #mpd {
      color: #c0caf5;
    }
  '';
}

