{ pkgs, ... }: {
    imports = [
        ./binds.nix
        ./decoration.nix
        ./exec.nix
    ];

    xdg.configFile."hypr/lock.sh".source = ./lock.sh;
    xdg.configFile."hypr/gamescope_tracker.sh" = {
        text = ''
            #!/bin/sh
            function handle {
              if [[ ''${1:0:10} == "focusedmon" ]]; then
                echo $(echo $1 | sed "s/.*,//") 
                if [[ $(echo $1 | sed "s/.*,//") == "steam" ]]; then
                  hyprctl dispatch submap gamescope
                else
                  hyprctl dispatch submap reset
                fi
              elif [[ ''${1:0:14} == "actevewindow>>" ]]; then
                  echo $1
                if [[ $(echo ''${1:14} | sed "s/,.*//") == "gamescope" ]]; then
                  hyprctl dispatch submap gamescope
                else
                  hyprctl dispatch submap reset
                fi
              fi
            }

            ${pkgs.socat}/bin/socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
        '';
        executable = true;
    };

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        plugins = [
        ];
        settings = {
            input = {
                kb_layout = "us";
                numlock_by_default = true;
                follow_mouse = 2;
                float_switch_override_focus = false;
                natural_scroll = false;
                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.3;
                };
            };
            gestures = {
                workspace_swipe = true;
            };
        };
    };
}
