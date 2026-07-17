{ self, lib, ... }: {
	flake.nixosModules.desktoppackages = { pkgs, lib, ... }: {
		environment.systemPackages = with pkgs; [
# Communication
            vesktop

# File Viewers
            nautilus
            mpv
            gthumb

# Productivity
            libreoffice
            pinta
            tagger
            inkscape
            krita 
            obs-studio

# Authentication
            ente-auth
            bitwarden-desktop

# CLI Utilities
            xdg-utils
            alsa-oss
            pavucontrol
            faudio
            zenity
            wl-clipboard
		];
	};
}
