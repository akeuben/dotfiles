{pkgs, config, inputs, ...}: {
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.nixvim = {
	    enable = true;
	    globals = {
	        mapleader = " ";
	    };
	    opts = {
	        number = true;
            nu = true;
            relativenumber = true;
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            smartindent = true;
            wrap = false;
            swapfile = false;
            backup = false;
            undodir = "${config.home.homeDirectory}/.local/data/vim/undo";
            undofile = true;
            termguicolors = true;
            hlsearch = false;
            incsearch = true;
            scrolloff = 8;
            updatetime = 50;
	    };
        colorschemes = {
            gruvbox.enable = true;
        };
        plugins = {
            lualine = {
                enable = true;
                settings = {
                    globalstatus = true;
                    component_separators = {
                        left = "";
                        right = "";
                    };
                    section_separators = {
                        left = "";
                        right = "";
                    };
                    sections = {
                        lualine_a = ["mode"];
                        lualine_b = ["branch" "diff"];
                        lualine_c = ["filename"];
                        lualine_x = ["require(\"noice\").api.statusline.mode.get()"];
                        lualine_y = ["filetype"];
                        lualine_z = ["location"];
                    };
                    winbar = {
                        lualine_a = [];
                        lualine_b = [];
                        lualine_c = ["filename"];
                        lualine_x = [];
                        lualine_y = [];
                        lualine_z = [];
                    };
                    inactive_winbar = {
                        lualine_a = [];
                        lualine_b = [];
                        lualine_c = ["filename"];
                        lualine_x = [];
                        lualine_y = [];
                        lualine_z = [];
                    };
                };
            };
            telescope = {
                enable = true;
                keymaps = {
                    "<leader>pf" = "find_files";
                    "<leader>gf" = "git_files";
                    "<leader>ps" = "live_grep";
                    "<leader>mm" = "harpoon marks";
                };
            };
            neo-tree = {
                enable = true;
            };
            treesitter = {
                enable = true;
            };
            web-devicons.enable = true;
            lsp = {
                enable = true;
                servers = {
                    java_language_server.enable = true;
                    html.enable = true;
                    jsonls.enable = true;
                    nixd.enable = true;
                    bashls.enable = false;
                    hls = {
                        enable = true;
                        installGhc = true;
                    };
                    cssls.enable = true;
                    rust_analyzer = {
                        enable = true;
                        installRustc = true;
                        installCargo = true;
                    };
                    ccls.enable = true;
                    ts_ls.enable = true;
                    zls = {
                        enable = true;
                        package = inputs.zls.packages.x86_64-linux.default;
                    };
                };
            };
            zig.enable = true;
            typescript-tools = {
                enable = true;
                settings = {
                    exposeAsCodeAction = "all";
                };
            };
            cmp = {
                enable = true;
                settings = {
                    completion.completeopt = "noselect";
                    preselect = "None";
                    mapping = {
                        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                        "<C-f>" = "cmp.mapping.scroll_docs(4)";
                        "<C-Space>" = "cmp.mapping.complete()";
                        "<C-e>" = "cmp.mapping.abort()";
                        "<CR>" = "cmp.mapping.confirm({ select = true })";
                        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    };
                    sources = [
                        {name = "nvim_lsp";}
                        {name = "path";}
                        {name = "buffer";}
                    ];
                };
            };
            fzf-lua = {
                enable = true;
                keymaps = {
                    "<leader>ca".action = "lsp_code_actions";
                    "<leader>cd".action= "lsp_definitions";
                    "<leader>cu".action= "lsp_references";
                    "<leader>bs".action= "lsp_document_symbols";
                };
            };
            harpoon = {
                enable = true;
                enableTelescope = true;
                keymaps = {
                    addFile = "<leader>a";
                    navNext = "<leader>n";
                    navPrev = "<leader>p";
                };
            };
            neogit = {
                enable = true;
                settings.kind = "floating";
            };
            noice = {
                enable = true;
            };
        };
        extraPlugins = with pkgs.vimPlugins; [
            octo-nvim
        ];
        extraConfigLua = ''
            require"octo".setup()

            vim.keymap.set('n', '<leader>oo', function() 
                vim.lsp.buf.code_action({
                    apply = true;
                    filter = function(i)
                        return string.sub(string.lower(i.title), 1, 3) == "org";
                    end
                });
            end)
        '';
        keymaps = [
            {
                key = "<C-b>";
                action = ":Neotree filesystem reveal toggle left<CR>";
            }
        ];
    };

    home.packages = with pkgs; [
        ripgrep
    ];
}
