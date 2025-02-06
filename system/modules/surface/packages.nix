{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        maliit-keyboard
    ];
}
