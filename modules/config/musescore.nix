{
    den.aspects.musescore = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                musescore
                muse-sounds-manager
            ];
        };
    };
}
