{pkgs, pkgs-unstable, ...}: {
    environment.systemPackages = with pkgs-unstable; [
        (lutris.override {
            extraLibraries = pkgs: [
                wineWowPackages.waylandFull
            ];
            extraPkgs = pkgs: [
                wineWowPackages.waylandFull
                dxvk
                vkd3d-proton
            ];
        })
        (callPackage ./packages/mcpelauncher {}) 
        cemu
        _2ship2harkinian
        pkgs.shipwright
        dolphin-emu
        pkgs.retroarchFull
        steam-rom-manager
        owmods-gui

        mangohud
        ryujinx
        steamtinkerlaunch
        (prismlauncher.override {additionalLibs = [ 
            xorg.libXtst 
            xorg.libXi
        ]; })
        pegasus-frontend
        antimicrox
    ];
}
