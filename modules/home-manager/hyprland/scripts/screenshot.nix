{ pkgs, ... }:
let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    SAVE_DIR="$HOME/Pictures/Screenshots"
    mkdir -p "$SAVE_DIR"

    case "$1" in
      "snip-freeze")
        ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -o -r -c '#ff0000ff')" -t ppm - | \
        ${pkgs.satty}/bin/satty --filename - \
          --fullscreen \
          --output-filename "$SAVE_DIR/satty-$(date '+%Y%m%d-%H%M%S').png" \
          --copy-command wl-copy
        ;;
      "print")
        ${pkgs.grim}/bin/grim -t ppm - | \
        ${pkgs.satty}/bin/satty --filename - \
          --fullscreen \
          --output-filename "$SAVE_DIR/satty-$(date '+%Y%m%d-%H%M%S').png" \
          --copy-command wl-copy
        ;;
      "monitor")
        ${pkgs.grim}/bin/grim -o "$(${pkgs.hyprland}/bin/hyprctl monitors -j | ${pkgs.jq}/bin/jq -r '.[] | select(.focused) | .name')" -t ppm - | \
        ${pkgs.satty}/bin/satty --filename - \
          --fullscreen \
          --output-filename "$SAVE_DIR/satty-$(date '+%Y%m%d-%H%M%S').png" \
          --copy-command wl-copy
        ;;
    esac

    # Show notification if file exists
    LATEST_SCREENSHOT="$SAVE_DIR/$(ls -t "$SAVE_DIR" | head -n1)"
    if [ -f "$LATEST_SCREENSHOT" ]; then
      ${pkgs.libnotify}/bin/notify-send "Screenshot" "Saved to $LATEST_SCREENSHOT" -i "$LATEST_SCREENSHOT"
    fi
  '';
in
{
  home.packages = with pkgs; [
    screenshot
    grim
    slurp
    satty
    wl-clipboard
    libnotify
    jq
  ];
} 