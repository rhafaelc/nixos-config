{ pkgs, ... }:
let
  clipboard-history = pkgs.writeShellScriptBin "clipboard-history" ''
    case $1 in
      "show")
        # Add trash icon and format the list with icons
        selected=$(printf " Clear History\n$(cliphist list | sed 's/^/  /')" | \
          rofi -dmenu -theme themes/clipboard \
               -p "󰅌 Clipboard" \
               -i \
               -matching fuzzy \
               -sorting-method fzf \
               -scroll-method 1 \
               -no-show-match true \
               -no-show-icons true \
               -markup-rows true \
               -kb-custom-1 "Alt+c")

        # Check if selection was made
        if [ $? -eq 10 ]; then
          # Alt+c was pressed - clear history
          cliphist wipe
          notify-send "Clipboard" "History cleared" -i dialog-information
        elif [ "$selected" = " Clear History" ]; then
          cliphist wipe
          notify-send "Clipboard" "History cleared" -i dialog-information
        elif [ -n "$selected" ]; then
          # Remove the leading icon before processing
          selected=$(echo "$selected" | sed 's/^  //')
          type=$(cliphist decode "$selected" | file -)
          if [[ $type == *"image"* ]]; then
            cliphist decode "$selected" > /tmp/clipboard-image
            imv /tmp/clipboard-image
          else
            cliphist decode "$selected" | wl-copy
            notify-send "Clipboard" "Copied to clipboard" -i clipboard
          fi
        fi
        ;;
      *)
        echo "Usage: $0 show"
        exit 1
        ;;
    esac
  '';
in
{
  home.packages = [ clipboard-history ];
} 