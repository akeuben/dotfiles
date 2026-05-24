{ self, inputs, ...}: {
	flake.nixosModules.nvim = { pkgs, lib, ... }: {
		environment.systemPackages = [
			self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
		];
	};

	perSystem = { pkgs, lib, self', ... }: {
		packages.nvim = inputs.wrapper-modules.wrappers.neovim.wrap {
			inherit pkgs;
			settings.config_directory = ./.;
			specs.plugins = {
				data = with pkgs.vimPlugins; [
					oil-nvim
					telescope-nvim
					nvim-treesitter.withAllGrammars
					blink-cmp
					nvim-lspconfig
				];
			};
			extraPackages = with pkgs; [
				nixd
				alejandra
			];
		};
	};
}
