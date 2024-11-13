{ pkgs, ... }: {
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        vulkan-loader
        vulkan-headers
        vulkan-validation-layers
    ];
}
