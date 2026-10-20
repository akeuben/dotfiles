{ self, inputs, ... }: {
    den.aspects.bigscreen = {
        nixos = { pkgs, ... }: let
            plasma-bigscreen-wrapped = self.packages.${pkgs.stdenv.hostPlatform.system}.plasma-bigscreen;
            plasma-bigscreen = pkgs.kdePackages.plasma-bigscreen;
        in
        {
            services.desktopManager.plasma6.enable = true;

            services.displayManager = {
                plasma-login-manager.enable = true;
                defaultSession = "plasma-bigscreen-wayland";
                autoLogin = {
                    enable = true;
                    user = "htpc";
                };
                sessionPackages = [ plasma-bigscreen-wrapped ];
            };

            environment.etc."xdg/applications-blacklistrc".text = ''
                [Applications]
                blacklist[$i]=waydroid.com.android.calculator2,waydroid.com.android.camera2,waydroid.com.android.contacts,waydroid.com.android.deskclock,waydroid.com.android.documentsui,waydroid.com.android.gallery3d,waydroid.com.android.inputmethod.latin,waydroid.com.android.settings,waydroid.org.lineageos.eleven,waydroid.org.lineageos.etar,waydroid.org.lineageos.jelly,waydroid.org.lineageos.recorder,org.kde.drkonqi.coredump.gui,org.kde.kdeconnect.app,org.kde.kdeconnect.sms,plasma-bigscreen-swap-session,org.kde.konsole,org.kde.kmenuedit,org.kde.plasma.emojier,org.kde.kinfocenter,org.kde.kwalletmanager,cups,nixos-manual,org.kde.qrca,org.kde.plasma-systemmonitor,systemsettings,org.kde.plasma.bigscreen.uvcviewer,xterm
            '';

            xdg.portal.configPackages = [ plasma-bigscreen ];

            environment.systemPackages = [ plasma-bigscreen ];

            environment.plasma6.excludePackages = with pkgs.kdePackages; [
                aurorae
                plasma-browser-integration
                kwin-x11
                ark
                elisa
                gwenview
                okular
                kate
                ktexteditor
                khelpcenter
                dolphin
                baloo-widgets
                dolphin-plugins
                spectacle
                ffmpegthumbs
                krdp
                discover
            ];

            programs.kdeconnect.enable = true;
        };
    };

    perSystem = { pkgs, ... }: {
        packages.plasma-bigscreen = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.kdePackages.plasma-bigscreen;
            exePath = "bin/plasma-bigscreen-wayland";
            binName = "plasma-bigscreen-wayland";
            wrapperFunction = inputs.wrapper-modules.lib.makeWrapper.wrapMain;

            extraPackages = [ pkgs.dbus ];
            argv0type = command_string: "exec dbus-run-session ${command_string}";
            passthru.providedSessions = [ "plasma-bigscreen-wayland" ];
            constructFiles.plasma-bigscreen-session = {
                relPath = "share/wayland-sessions/plasma-bigscreen-wayland.desktop";
                content = ''
                    [Desktop Entry]
                    Name=Plasma Bigscreen
                    Comment=Plasma Bigscreen Session
                    Exec = ${placeholder "out"}/bin/plasma-bigscreen-wayland
                    Type=Application
                '';
            };
        };
    };
}
