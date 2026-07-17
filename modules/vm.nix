# enables `nix run .#vm`. it is very useful to have a VM
# you can edit your config and launch the VM to test stuff
# instead of having to reboot each time.
{ inputs, den, ... }:
{
# USER TODO: remove this tty-autologin used for the VM
    den.aspects.voyager.includes = [ (den.batteries.tty-autologin "avery") ];

    perSystem =
    { pkgs, ... }:
    {
        packages.vm = pkgs.writeShellApplication {
            name = "vm";
            text =
                let
                host = inputs.self.nixosConfigurations.voyager.config;
            in
                ''
                ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
                '';
        };
    };
}
