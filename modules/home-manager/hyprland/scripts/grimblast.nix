{ pkgs, ... }:
let
  grimblast = pkgs.writeShellScriptBin "grimblast" ''
    ## Modified grimblast
    ## Credit: https://github.com/hyprwm/contrib

    notify_user() {
      notify-send -t 3000 -i ${pkgs.grimblast}/share/icons/hicolor/48x48/apps/com.github.grimblast.png "$@"
    }

    copy_to_clipboard() {
      wl-copy
    }

    show_message() {
      local action=$1
      local file=$2
      
      notify_user "Screenshot" "Screenshot $action to $file"
    }

    NOTIFY=no
    CURSOR=yes
    FREEZE=no
    WAIT=no

    while [ $# -gt 0 ]; do
      case "$1" in
        --notify) NOTIFY=yes ;;
        --cursor) CURSOR=yes ;;
        --no-cursor) CURSOR=no ;;
        --freeze) FREEZE=yes ;;
        --wait) WAIT=yes ;;
        *) break ;;
      esac
      shift
    done

    ACTION=$1
    WHAT=$2
    FILENAME=$3

    if [ -z "$FILENAME" ]; then
      FILENAME="$(xdg-user-dir PICTURES)/Screenshots/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"
      mkdir -p "$(dirname "$FILENAME")"
    fi

    case "$ACTION" in
      copy|copysave)
        case "$WHAT" in
          active)
            grimshot save active - | copy_to_clipboard
            [ "$ACTION" = "copysave" ] && grimshot save active "$FILENAME"
            ;;
          screen)
            grimshot save screen - | copy_to_clipboard
            [ "$ACTION" = "copysave" ] && grimshot save screen "$FILENAME"
            ;;
          area)
            grimshot save area - | copy_to_clipboard
            [ "$ACTION" = "copysave" ] && grimshot save area "$FILENAME"
            ;;
          output)
            grimshot save output - | copy_to_clipboard
            [ "$ACTION" = "copysave" ] && grimshot save output "$FILENAME"
            ;;
        esac
        
        if [ "$ACTION" = "copysave" ]; then
          show_message "saved and copied" "$FILENAME"
        else
          show_message "copied" "$FILENAME"
        fi
        ;;
      save)
        grimshot save "$WHAT" "$FILENAME"
        show_message "saved" "$FILENAME"
        ;;
      *)
        echo "Usage: grimblast [--notify] [--cursor] [--freeze] [--wait] (copy|save) (active|screen|area|output) [FILE]"
        exit 1
        ;;
    esac
  '';
in
{
  home.packages = [ grimblast ];
} 