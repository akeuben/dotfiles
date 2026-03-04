{pkgs, inputs, ...}: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
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
        pkgs.retroarch-full
        steam-rom-manager
        owmods-gui

        mangohud
        ryubing
        steamtinkerlaunch
        (prismlauncher.override {additionalLibs = [ 
            xorg.libXtst 
            xorg.libXi
        ]; jdks = [
            jdk21
            jdk17 
            temurin-jre-bin-8
        ]; })
        pegasus-frontend
        antimicrox
    ] ++ [
        inputs.hytale.packages.x86_64-linux.hytale-launcher
    ];
}
