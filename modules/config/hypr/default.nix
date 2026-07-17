{den, inputs,...}: {
    den.aspects.hypr = {
        includes = with den.aspects; [
            kappashell
        ];
        nixos = {pkgs, ...}: {
            programs.hyprland = {
                enable = true;
            };

            environment.systemPackages = with pkgs; [
                hyprpaper
                firefox
                kitty
                inputs.shell.packages.${pkgs.stdenv.hostPlatform.system}.kappashell-desktop
            ];
        };

        homeManager = {pkgs, lib, ...}: {
            wayland.windowManager.hyprland = {
                enable = true;
                configType = "lua";

                settings = let mod = "ALT"; in {
                    config = {
                        general = {
                            gaps_in = 5;
                            gaps_out = 15;
                            border_size = 2;

                            layout = "dwindle";
                        };
                        decoration = {
                            rounding = 24;
                            blur = {
                                enabled = true;
                                size = 3;
                                passes = 4;
                                xray = true;
                                ignore_opacity = false;
                                new_optimizations = true;
                            };
                        };
                        layerrule = [
                            "blur, ^shell:"
                            "ignorezero, ^shell:"
                            "xray 1, ^shell:"
                            "animation slidevert, ^shell:"
                            "order 2, ^shell:bar"
                            "order 5, ^shell:control_center"
                            "order 7, ^shell:calendar"
                            "noanim, ^shell"
                        ];
                        windowrulev2 = [
                            "float,title:^Unlock Database - KeePassXC$"
                            "float,title:^(zoom)$"
                            "float,title:^(?!Steam$).*,class:steam"
                            "fullscreen,class:gamescope"
                            "workspace name:steam,class:gamescope"
                            "monitor DP-1,class:gamescope"
                            "fullscreen,initialTitle:Steam Big Picture Mode"
                            "workspace name:steam,initialTitle:Steam Big Picture Mode"
                            "monitor DP-1,initialTitle:Steam Big Picture Mode"
                            "suppressevent fullscreen maximize fullscreenoutput,class:gamescope"
                        ];
                        misc = {
                            disable_hyprland_logo = true;
                            middle_click_paste = false;
                        };
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
                    };
                    bind = [
                        { _args = [
                            "${mod} + F" 
                            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"firefox\")")
                        ];}
                        { _args = [
                            "${mod} + Return" 
                            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
                        ];}
                        { _args = [
                            "${mod} + P" 
                            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kappashell-desktop popup open runner bottom\")")
                        ];}
                        { _args = [
                            "${mod} + Q" 
                            (lib.generators.mkLuaInline "hl.dsp.exit()")
                        ];}
                    ] ++ (
                        builtins.concatLists (builtins.genList (i: let 
                            ws = if i == 0 then 10 else i;
                        in [
                            { _args = [
                                "${mod} + ${toString i}" 
                                (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"${toString ws}\", on_current_monitor = true})")
                            ];}
                        ]) 9)
                    );
                    on = {
                        _args = [
                            "hyprland.start"
                            (lib.generators.mkLuaInline "function()\nhl.exec_cmd(\"kappashell-desktop\")\nend")
                        ];
                    };
                };
            };
        };
    };
}
