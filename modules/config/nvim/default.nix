{ self, inputs, ...}: {
	den.aspects.nvim = {
		provides.to-users.homeManager = {pkgs, config, ...}: {
			home.packages = [
				(self.packages.${pkgs.stdenv.hostPlatform.system}.nvim.wrap {
                    info.base16colors = pkgs.lib.filterAttrs (k: v:
                        builtins.match "base0[0-9A-F]" k != null
                    ) config.lib.stylix.colors.withHashtag;
                })
			];
		};

        nixos = {pkgs, config, ...}: {
            environment.systemPackages = [
				(self.packages.${pkgs.stdenv.hostPlatform.system}.nvim.wrap {
                    info.base16colors = pkgs.lib.filterAttrs (k: v:
                        builtins.match "base0[0-9A-F]" k != null
                    ) config.lib.stylix.colors.withHashtag;
                })
            ];
        };
	};

	perSystem = { pkgs, ... }: {
		packages.nvim = inputs.wrapper-modules.wrappers.neovim.wrap {
			inherit pkgs;
			settings.config_directory = ./.;
			specs.plugins = {
				data = with pkgs.vimPlugins; [
					oil-nvim
					telescope-nvim
					nvim-treesitter.withAllGrammars
                    base16-nvim
					blink-cmp
					nvim-lspconfig
				];
			};
			runtimePkgs = with pkgs; [
				nixd
				alejandra
                zls_0_15
				ripgrep
                vala-language-server
                vala-lint
                gopls
			];
		};
	};
}
