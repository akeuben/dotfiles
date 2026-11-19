local servers = {}

servers.zls = require "lsp.zls"
servers.nixd = require "lsp.nixd"
servers.vala_ls = require "lsp.vala"
servers.gopls = require "lsp.gopls"

for server_name, cfg in pairs(servers) do 
    vim.lsp.config[server_name] = cfg
    vim.lsp.enable(server_name)
end

vim.diagnostic.config { virtual_lines = true }
