set script_dir (dirname (status filename))

source "$script_dir/theme.fish"
source "$script_dir/ssh.fish"
source "$script_dir/nix.fish"

function fish_ssh_agent
    if test -z "$SSH_ENV"
        set -xg SSH_ENV $HOME/.ssh/environment
    end

    if not __ssh_agent_is_started
        __ssh_agent_start
    end
end

status is-interactive; and begin
    alias cl 'command clear'
    alias clear 'command clear && fish_greeting'
    alias v "nvim"
    alias vi "nvim"
    alias vim "nvim"
    
    fish_ssh_agent

    if type -q tmux 
        if not test -z $(tty | grep pts); and not set -q TMUX
            set -x TMUX_SHLVL $SHLVL
            exec tmux new -A -s avery 
        end 
    end

    # NixOS config does not include a kitty option,
    # so we must enable the integration ourself!
    if set -q KITTY_INSTALLATION_DIR
        set --global KITTY_SHELL_INTEGRATION no-rc
        source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
        set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d/"
    end
end
