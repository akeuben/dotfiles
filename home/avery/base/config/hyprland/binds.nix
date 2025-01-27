{ inputs, pkgs, ... }: let
    mainMod = "SUPER";
in{
    wayland.windowManager.hyprland.extraConfig = ''
        submap = reset
        bindm = ${mainMod}, mouse:272, movewindow
        bindm = ${mainMod}, mouse:273, resizewindow

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = ${mainMod} SHIFT, 1, movetoworkspace, 1
        bind = ${mainMod} SHIFT, 2, movetoworkspace, 2
        bind = ${mainMod} SHIFT, 3, movetoworkspace, 3
        bind = ${mainMod} SHIFT, 4, movetoworkspace, 4
        bind = ${mainMod} SHIFT, 5, movetoworkspace, 5
        bind = ${mainMod} SHIFT, 6, movetoworkspace, 6
        bind = ${mainMod} SHIFT, 7, movetoworkspace, 7
        bind = ${mainMod} SHIFT, 8, movetoworkspace, 8
        bind = ${mainMod} SHIFT, 9, movetoworkspace, 9
        bind = ${mainMod} SHIFT, 0, movetoworkspace, 10

        # Open Application Launcher
        bind = ${mainMod}, P, exec, ${inputs.ags.packages.${pkgs.system}.io}/bin/astal '{"type": "runner"}'
        bind = ${mainMod}, return, exec, kitty
        bind = ${mainMod}, C, killactive
        bind = ${mainMod}, V, togglefloating
        bind = ${mainMod}, J, togglesplit, dwindle
        bind = ${mainMod}, F, fullscreen
        bind = ${mainMod}, L, exec, /home/avery/.config/hypr/lock.sh

        # Move focus with mainMod + arrow keys
        bind = ${mainMod}, left, movefocus, l
        bind = ${mainMod}, right, movefocus, r
        bind = ${mainMod}, up, movefocus, u
        bind = ${mainMod}, down, movefocus, d

        # Switch workspaces with mainMod + [0-9]
        bind = ${mainMod}, 1, moveworkspacetomonitor, 1 current
        bind = ${mainMod}, 1, workspace, 1
        bind = ${mainMod}, 2, moveworkspacetomonitor, 2 current
        bind = ${mainMod}, 2, workspace, 2
        bind = ${mainMod}, 3, moveworkspacetomonitor, 3 current
        bind = ${mainMod}, 3, workspace, 3
        bind = ${mainMod}, 4, moveworkspacetomonitor, 4 current
        bind = ${mainMod}, 4, workspace, 4
        bind = ${mainMod}, 5, moveworkspacetomonitor, 5 current
        bind = ${mainMod}, 5, workspace, 5
        bind = ${mainMod}, 6, moveworkspacetomonitor, 6 current
        bind = ${mainMod}, 6, workspace, 6
        bind = ${mainMod}, 7, moveworkspacetomonitor, 7 current
        bind = ${mainMod}, 7, workspace, 7
        bind = ${mainMod}, 8, moveworkspacetomonitor, 8 current
        bind = ${mainMod}, 8, workspace, 8
        bind = ${mainMod}, 9, moveworkspacetomonitor, 9 current
        bind = ${mainMod}, 9, workspace, 9
        bind = ${mainMod}, 10, moveworkspacetomonitor, 10 current
        bind = ${mainMod}, 0, workspace, 10

        bind = ,XF86Launch7,exec,/home/avery/.config/hypr/steam.sh
        bind = ${mainMod},G,exec,/home/avery/.config/hypr/steam.sh

        # Scroll through existing workspaces with mainMod + scroll
        bind = ${mainMod}, mouse_down, workspace, e+1
        bind = ${mainMod}, mouse_up, workspace, e-1

        bind = ,XF86MonBrightnessUp,exec,brightnessctl +5%
        bind = ,XF86MonBrightnessDown,exec,brightnessctl 5%-

        submap = gamescope
        bind = ${mainMod}, L, exec, /home/avery/.config/hypr/lock.sh

        # Move focus with mainMod + arrow keys
        bind = ${mainMod}, left, movefocus, l
        bind = ${mainMod}, right, movefocus, r
        bind = ${mainMod}, up, movefocus, u
        bind = ${mainMod}, down, movefocus, d

        # Switch workspaces with mainMod + [0-9]
        bind = ${mainMod}, 1, moveworkspacetomonitor, 1 current
        bind = ${mainMod}, 1, workspace, 1
        bind = ${mainMod}, 2, moveworkspacetomonitor, 2 current
        bind = ${mainMod}, 2, workspace, 2
        bind = ${mainMod}, 3, moveworkspacetomonitor, 3 current
        bind = ${mainMod}, 3, workspace, 3
        bind = ${mainMod}, 4, moveworkspacetomonitor, 4 current
        bind = ${mainMod}, 4, workspace, 4
        bind = ${mainMod}, 5, moveworkspacetomonitor, 5 current
        bind = ${mainMod}, 5, workspace, 5
        bind = ${mainMod}, 6, moveworkspacetomonitor, 6 current
        bind = ${mainMod}, 6, workspace, 6
        bind = ${mainMod}, 7, moveworkspacetomonitor, 7 current
        bind = ${mainMod}, 7, workspace, 7
        bind = ${mainMod}, 8, moveworkspacetomonitor, 8 current
        bind = ${mainMod}, 8, workspace, 8
        bind = ${mainMod}, 9, moveworkspacetomonitor, 9 current
        bind = ${mainMod}, 9, workspace, 9
        bind = ${mainMod}, 10, moveworkspacetomonitor, 10 current
        bind = ${mainMod}, 0, workspace, 10

        # Scroll through existing workspaces with mainMod + scroll
        bind = ${mainMod}, mouse_down, workspace, e+1
        bind = ${mainMod}, mouse_up, workspace, e-1

        bind = ,XF86MonBrightnessUp,exec,brightnessctl +5%
        bind = ,XF86MonBrightnessDown,exec,brightnessctl 5%-
    '';
}
