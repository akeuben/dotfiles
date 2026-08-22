{
    den.aspects.ship = {
	nixos = {pkgs, ...}: {
            environment.systemPackages = with pkgs; [
                _2ship2harkinian
                shipwright
            ];
        };
    };
}
