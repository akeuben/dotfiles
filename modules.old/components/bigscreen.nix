{ self, inputs, ...}: {
    flake.nixosModules.bigscreen = {pkgs, lib, ...}: let 
        plasma-bigscreen-wrapped = self.packages.${pkgs.stdenv.hostPlatform.system}.plasma-bigscreen;
        plasma-bigscreen = pkgs.kdePackages.plasma-bigscreen;
    in {
        services.desktopManager.plasma6 = {
            enable = true;
            
        };

        services.displayManager = {
            plasma-login-manager = {
                enable = true;
            };

            defaultSession = "plasma-bigscreen-wayland";

            sessionPackages = [
                plasma-bigscreen-wrapped
            ];
        };

        xdg.portal.configPackages = [ plasma-bigscreen ];

        environment.systemPackages = [
            plasma-bigscreen
        ];
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

	perSystem = { pkgs, lib, self', ... }: {
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
