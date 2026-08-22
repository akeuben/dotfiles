{
    den.aspects.steam = {
        nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                mangohud
                steamtinkerlaunch
            ];

            programs.steam = {
                enable = true;
                remotePlay.openFirewall = true;
                dedicatedServer.openFirewall = true;
                extraCompatPackages = with pkgs; [
                    proton-ge-bin
                ];
                extraPackages = with pkgs; [
                    hidapi
                ];
            };
            hardware.steam-hardware.enable = true;

            programs.gamescope = {
                enable = true;
                capSysNice = true;
            };
        };
    };
}
