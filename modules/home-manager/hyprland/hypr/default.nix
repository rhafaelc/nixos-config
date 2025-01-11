{ 
  pkgs, 
  lib, 
  config,
  ... 
} : {
  home.packages = with pkgs; [
    # Theme-related
    font-awesome
    nerd-fonts.jetbrains-mono
    
    # Audio
    pamixer        # CLI audio control
    playerctl      # Media player control
    
    # Screenshots/Recording
    grim          # Screenshot tool
    slurp         # Screen area selection
    wf-recorder   # Screen recording
    jq            # JSON processor
    
    # System
    wlsunset      # Night light
    waybar        # Status bar
    rofi-wayland  # Application launcher
    
    # Utils
    wl-clipboard  # Clipboard
    cliphist      # Clipboard history
    
    # System monitoring
    btop          # Resource monitor
    
    # File management
    xfce.thunar   # File manager (lighter than nautilus)
    
    # Notifications
    libnotify     # Notification library
    dunst         # Notification daemon
    imv  # Add this line

    satty
  ];

  xdg.configFile = {
    "hypr/mocha.conf".source = ./mocha.conf;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      misc = {
        disable_hyprland_qtutils_check = true;
      };


      monitor= [
        ",1920x1080, auto, 1, bitdepth, 8"
        ",preferred,auto,1,mirror,eDP-1,bitdepth,8"
      ];

      xwayland = {
        force_zero_scaling = true;
      };


      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";


      exec-once = [
        "waybar"
        "swaync"
        "mkdir -p ~/.cache/cliphist"
        "echo 'max_elements = 100' > ~/.cache/cliphist/config"  # Limit to 100 entries
        "wl-paste --type text --watch cliphist store"    # Store text clips
        "wl-paste --type image --watch cliphist store"   # Store image clips
      #   "$terminal"
      #   "nm-applet &"
      #   "waybar & hyprpaper & firefox"
      ];

      env = lib.mkForce [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 8;

        border_size = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base0D})";
        "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base02})";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 8;

        # Change transparency of focused and unfocused windows
        active_opacity = 0.95;
        inactive_opacity = 0.85;

        shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = lib.mkDefault "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
        };
      };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.85, 0.03, 0.97"
        "winIn, 0.07, 0.88, 0.04, 0.99"
        "winOut, 0.20, -0.15, 0, 1"
        "liner, 1, 1, 1, 1"
        "md3_standard, 0.12, 0, 0, 1"
        "md3_decel, 0.05, 0.80, 0.10, 0.97"
        "md3_accel, 0.20, 0, 0.80, 0.08"
        "overshot, 0.05, 0.85, 0.07, 1.04"
        "crazyshot, 0.1, 1.22, 0.68, 0.98"
        "hyprnostretch, 0.05, 0.82, 0.03, 0.94"
        "menu_decel, 0.05, 0.82, 0, 1"
        "menu_accel, 0.20, 0, 0.82, 0.10"
        "easeInOutCirc, 0.75, 0, 0.15, 1"
        "easeOutCirc, 0, 0.48, 0.38, 1"
        "easeOutExpo, 0.10, 0.94, 0.23, 0.98"
        "softAcDecel, 0.20, 0.20, 0.15, 1"
        "md2, 0.30, 0, 0.15, 1"
        "OutBack, 0.28, 1.40, 0.58, 1"
        "easeInOutCirc, 0.78, 0, 0.15, 1"
      ];
      animation = [
        "border, 1, 1.6, liner"
        "borderangle, 1, 82, liner, loop"
        "windowsIn, 1, 3.2, winIn, slide"
        "windowsOut, 1, 2.8, easeOutCirc"
        "windowsMove, 1, 3.0, wind, slide"
        "fade, 1, 1.8, md3_decel"
        "layersIn, 1, 1.8, menu_decel, slide"
        "layersOut, 1, 1.5, menu_accel"
        "fadeLayersIn, 1, 1.6, menu_decel"
        "fadeLayersOut, 1, 1.8, menu_accel"
        "workspaces, 1, 4.0, menu_decel, slide"
        "specialWorkspace, 1, 2.3, md3_decel, slidefadevert 15%"
      ];
    };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      master = {
        new_status = "master";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true;
            scroll_factor = 0.2;
        };
      };

      gestures = {
        workspace_swipe = true;
      };


      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
    
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod SHIFT, F, togglefloating,"
        "$mainMod, R, exec, $menu"
        # "$mainMod, P, pseudo," # dwindle
        # "$mainMod, J, togglesplit," # dwindle

        "$mainMod SHIFT, L, exec, hyprlock"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"


        # Example special workspace (scratchpad)
        "ALT, TAB, togglespecialworkspace, magic"
        "ALT SHIFT, TAB, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod CTRL_L, right, workspace, e+1"
        "$mainMod CTRL_L, left, workspace, e-1"
       
        "$mainMod, V, exec, clipboard-history show"

        # Screenshot bindings
        "$mainMod SHIFT, S, exec, grim -t ppm - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
        ", Print, exec, grim -t ppm - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod CTRL_L, mouse:272, resizewindow"
      ];


      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      # Requires playerctl
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Fix some dragging issues with XWayland
      windowrulev2 = "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0";
    };
  };
}
