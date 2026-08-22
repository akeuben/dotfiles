{ self, inputs, ...}: {
	den.aspects.nvim = {
		nixos = {pkgs, ...}: {
			environment.systemPackages = [
				self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
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
					blink-cmp
					nvim-lspconfig
				];
			};
			runtimePkgs = with pkgs; [
				nixd
				alejandra
				ripgrep
			];
		};
	};
}
