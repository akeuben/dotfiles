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

servers.tls = {
    init_options = { hostInfo = 'neovim' },
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    handlers = {
        -- handle rename request for certain code actions like extracting functions / types
        ['_typescript.rename'] = function(_, result, ctx)
            local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
            vim.lsp.util.show_document({
                uri = result.textDocument.uri,
                range = {
                    start = result.position,
                    ['end'] = result.position,
                },
            }, client.offset_encoding)
            vim.lsp.buf.rename()
            return vim.NIL
        end,
    },
    on_attach = function(client)
        -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
        -- `vim.lsp.buf.code_action()` if specified in `context.only`.
        vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
            local source_actions = vim.tbl_filter(function(action)
                return vim.startswith(action, 'source.')
            end, client.server_capabilities.codeActionProvider.codeActionKinds)

            vim.lsp.buf.code_action({
                context = {
                    only = source_actions,
                },
            })
        end, {})
    end,
}

servers.zls = {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zir' },
    root_markers = { 'zls.json', 'build.zig', '.git' },
    workspace_required = false,
}

local mod_cache = nil
local std_lib = nil

---@param custom_args go_dir_custom_args
---@param on_complete fun(dir: string | nil)
local function identify_go_dir(custom_args, on_complete)
    local cmd = { 'go', 'env', custom_args.envvar_id }
    vim.system(cmd, { text = true }, function(output)
        local res = vim.trim(output.stdout or '')
        if output.code == 0 and res ~= '' then
            if custom_args.custom_subdir and custom_args.custom_subdir ~= '' then
                res = res .. custom_args.custom_subdir
            end
            on_complete(res)
        else
            vim.schedule(function()
                vim.notify(
                    ('[gopls] identify ' .. custom_args.envvar_id .. ' dir cmd failed with code %d: %s\n%s'):format(
                        output.code,
                        vim.inspect(cmd),
                        output.stderr
                    )
                )
            end)
            on_complete(nil)
        end
    end)
end

local function get_std_lib_dir()
    if std_lib and std_lib ~= '' then
        return std_lib
    end

    identify_go_dir({ envvar_id = 'GOROOT', custom_subdir = '/src' }, function(dir)
        if dir then
            std_lib = dir
        end
    end)
    return std_lib
end

local function get_mod_cache_dir()
    if mod_cache and mod_cache ~= '' then
        return mod_cache
    end

    identify_go_dir({ envvar_id = 'GOMODCACHE' }, function(dir)
        if dir then
            mod_cache = dir
        end
    end)
    return mod_cache
end

local function get_root_dir(fname)
    if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
        local clients = vim.lsp.get_clients({ name = 'gopls' })
        if #clients > 0 then
            return clients[#clients].config.root_dir
        end
    end
    if std_lib and fname:sub(1, #std_lib) == std_lib then
        local clients = vim.lsp.get_clients({ name = 'gopls' })
        if #clients > 0 then
            return clients[#clients].config.root_dir
        end
    end
    return vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git')
end

servers.gopls = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        get_mod_cache_dir()
        get_std_lib_dir()
        -- see: https://github.com/neovim/nvim-lspconfig/issues/804
        on_dir(get_root_dir(fname))
    end,
}

for server_name, cfg in pairs(servers) do 
    vim.lsp.config[server_name] = cfg
    vim.lsp.enable(server_name)
end

vim.diagnostic.config { virtual_lines = true }
