{inputs, config, ...}: let 
    utils = inputs.nixCats.utils;
in {
    nixCats = {
        enable = builtins.trace "nixcats enabled" true;

        addOverlays = [
            (utils.standardPluginOverlay inputs)
        ];

        packageNames = ["mynvim"];

        nixpkgs_version = inputs.nixpkgs-unstable;

        luaPath = ./.;

        categoryDefinitions.replace = ({pkgs, ...}: {
            lspsAndRuntimeDeps = {
                general = with pkgs; [
                    ripgrep
                    gcc
                ];
                lua = with pkgs; [
                    lua-language-server
                    stylua
                ];
                nix = with pkgs; [
                    nixd 
                    alejandra
                ];
            };
            startupPlugins = {
                general = with pkgs.vimPlugins; [
                    oil-nvim
                    telescope-nvim
                    nvim-treesitter.withAllGrammars
                    base16-nvim
                    blink-cmp
                ];
            };
        });

        packageDefinitions.replace = {
            mynvim = {pkgs, ...}: {
                settings = {
                    suffix-path = true;
                    suffix-LD = true;
                    wrapRc = true;
                    aliases = ["nvim" "vim" "vi" "v"];
                    hosts.node.enable = true;
                };
                categories = {
                    general = true;
                    lua = true;
                    nix = true;
                };
                extra = {
                    nixdExtras = {
                        nixpkgs = ''import ${pkgs.path} {}'';
                        nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options'';
                        home_manager_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").homeConfigurations.configname.options'';
                    };
                    base16colors = pkgs.lib.filterAttrs (k: v:
                        builtins.match "base0[0-9A-F]" k != null
                    ) config.lib.stylix.colors.withHashtag;
                };
            };
        };
    };
}
