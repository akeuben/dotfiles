{ ... }: {
    programs.fish.shellAliases = {
        # UI aliases
        "neofetch" = "fastfetch -s Title:Separator:OS:Host:Kernel:Uptime:Shell:Display:DE:WM:WMTheme:Theme:Icons:Terminal:CPU:GPU:Memory:Break:Battery:Colors --ds-force-drm";
        "clear" = "command clear && fish_greeting";
        "cl" = "command clear";
    };
}
