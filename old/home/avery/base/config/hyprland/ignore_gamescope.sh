if [ "$(hyprctl activewindow -j | jq -r ".class")" = "gamescope" ]; then
    # Suppress
else
    hyprctl dispatch $@
fi
