if not nixCats('general') then
    return
end

vim.lsp.set_log_level("debug")

local servers = {}

servers.luals = {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

servers.nixd = {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix' },
    settings = {
        nixd = {
            nixpkgs = {
                expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
            },
            options = {
                nixos = {
                    expr = nixCats.extra("nixdExtras.nixos_options")
                },
                ["home-manager"] = {
                    expr = nixCats.extra("nixdExtras.home_manager_options")
                }
            },
            formatting = {
                command = { "alejandra" }
            }
        }
    }
}

for server_name, cfg in pairs(servers) do 
    vim.lsp.config[server_name] = cfg
    vim.lsp.enable(server_name)
end

vim.diagnostic.config { virtual_lines = true }
