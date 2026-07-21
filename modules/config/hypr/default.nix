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
            ];
        };

        provides.to-users.homeManager = {lib, ...}: {
            wayland.windowManager.hyprland = {
                enable = true;
                configType = "lua";

                settings = let 
                    mod = "SUPER";
                    dsp0 = dsp: lib.generators.mkLuaInline "hl.dsp.${dsp}()";
                    dsp1 = dsp: arg: lib.generators.mkLuaInline "hl.dsp.${dsp}(${arg})";
                    exec_cmd = cmd: dsp1 "exec_cmd" "\"${cmd}\"";
                    exit = dsp0 "exit";
                    focus = ws: on_current: dsp1 "focus" "{workspace = ${toString ws}, on_current_monitor = ${toString on_current}}";
                    window = {
                        move = ws: follow: dsp1 "window.move" "{workspace = ${toString ws}, follow = ${toString follow}}";
                        fullscreen = dsp1 "window.fullscreen" "{mode = \"fullscreen\"}";
                        float = dsp1 "window.float" "{}";
                        drag = dsp0 "window.drag";
                        resize = dsp0 "window.resize";
                        exit = dsp0 "window.close";
                        kill = dsp0 "window.kill";
                    };
                in {
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
                                disable_while_typing = true;
                            };
                        };
                    };
                    gesture = [
                        {_args = [
                            (lib.generators.mkLuaInline "{fingers = 3, direction = \"horizontal\", action = \"workspace\"}")
                        ];}
                    ];
                    bind = [
                        { _args = [
                            "${mod} + B"
                            (exec_cmd "firefox")
                        ];}
                        { _args = [
                            "${mod} + Return" 
                            (exec_cmd "kitty")
                        ];}
                        { _args = [
                            "${mod} + F" 
                            window.fullscreen
                        ];}
                        { _args = [
                            "${mod} + V" 
                            window.float
                        ];}
                        { _args = [
                            "${mod} + P" 
                            (exec_cmd "kappashell-desktop popup open runner bottom")
                        ];}
                        { _args = [
                            "${mod} + C" 
                            window.exit
                        ];}
                        { _args = [
                            "${mod} + SHIFT + C" 
                            window.kill
                        ];}
                        { _args = [
                            "CTRL + ALT + Delete" 
                            exit
                        ];}
                        { _args = [
                            "${mod} + mouse:272"
                            window.drag
                        ];}
                        { _args = [
                            "${mod} + mouse:273"
                            window.resize
                        ];}
                    ] ++ (
                        builtins.concatLists (builtins.genList (i: let 
                            ws = if i == 0 then 10 else i;
                        in [
                            { _args = [
                                "${mod} + ${toString i}" 
                                (focus ws true)
                            ];}
                            { _args = [
                                "${mod} + SHIFT + ${toString i}" 
                                (window.move ws true)
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
