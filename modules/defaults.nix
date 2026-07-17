{ lib, ... }:
{
    den.default.nixos.system.stateVersion = "25.11";
    den.default.homeManager.home.stateVersion = "25.11";
    den.default.nixos.home-manager.useGlobalPkgs = true;
    den.default.nixos.home-manager.useUserPackages = true;
    den.default.homeManager.programs.home-manager.enable = true;

    # enable hm by default
    den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
