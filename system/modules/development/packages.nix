{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        godot_4
        blender
        krita
        ardour
        yabridge
        sfizz
        polyphone
        decent-sampler
        calf

        # Generic Programming
        vscode
        jetbrains.idea-community
        eclipses.eclipse-java
        logisim
        cmake
        fastfetch
        onefetch
        tmux
        tmux-sessionizer
        wget
        git
        gh

        mysql-workbench

        # Notes and Math
        texstudio
        texlive.combined.scheme-full
        obsidian
        renderdoc
    ];
}
