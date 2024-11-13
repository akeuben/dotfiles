{pkgs, ...}: {
    environment.systemPackages = with pkgs;[
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
        cemu
        _2ship2harkinian
        shipwright
        dolphin-emu
        (retroarch.override {
            cores = with libretro; [
                atari800
                blastem
                bluemsx
                bsnes
                desmume
                desmume2015
                dolphin
                dosbox
                easyrpg
                fbalpha2012
                fbneo
                fceumm
                flycast
                fmsx
                freeintv
                fuse
                gambatte
                gpsp
                gw
                handy
                hatari
                mame
                mame2000
                mame2003
                mame2003-plus
                mame2010
                mame2015
                mame2016
                melonds
                mesen
                mesen-s
                meteor
                mgba
                mrboom
                mupen64plus
                neocd
                nestopia
                nxengine
                np2kai
                o2em
                opera
                parallel-n64
                pcsx2
                pcsx-rearmed
                picodrive
                play
                ppsspp
                prboom
                prosystem
                puae
                quicknes
                sameboy
                same_cdi
                scummvm
                smsplus-gx
                snes9x
                snes9x2002
                snes9x2005
                snes9x2005-plus
                snes9x2010
                stella
                stella2014
                swanstation
                tgbdual
                thepowdertoy
                tic80
                vba-m
                vba-next
                vecx
                virtualjaguar
                yabause
            ];
        })
        steam-rom-manager

        mangohud
        ryujinx
        steamtinkerlaunch
        (prismlauncher.override {additionalLibs = [ 
            xorg.libXtst 
            xorg.libXi
        ]; })
        pegasus-frontend
    ];
}
