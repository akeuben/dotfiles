local servers = {}
servers.nixd =  {
    cmd = { "nixd" },
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "alejandra" },
            },
        },
    },
}

servers.zls = {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zir', 'zon' },
    root_markers = { 'zls.json', 'build.zig.zon', '.git' },
    workspace_required = false,
}

for server_name, cfg in pairs(servers) do 
    vim.lsp.config[server_name] = cfg
    vim.lsp.enable(server_name)
end

vim.diagnostic.config { virtual_lines = true }
