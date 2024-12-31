{ pkgs, ... }: {
    gtk = {
        enable = true;
        iconTheme = {
            name = "kora";
            package = pkgs.kora-icon-theme;
        };
    };
}
