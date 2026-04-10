{ pkgs, ... }: {
    programs.iio-hyprland.enable = true;
    environment.systemPackages = with pkgs; [
        jq
    ];
}
