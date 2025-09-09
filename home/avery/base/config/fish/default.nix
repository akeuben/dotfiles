{ pkgs, ... }: {
    imports = [
        ./aliases.nix
        ./functions/nix.nix
        ./functions/ssh.nix
        ./functions/fish.nix
    ];
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            fish_ssh_agent
            
            if not test -z $(tty | grep pts); and not set -q TMUX;
                set -x TMUX_SHLVL $SHLVL
                exec tmux new -A -s avery
            end
        '';

        shellInit = ''
        direnv hook fish | source
        '';
        plugins = [
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
        ];
    };
}
