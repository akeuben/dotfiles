-- e.g. in your config_directory, plugin/treesitter.lua or similar
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*", -- or list specific filetypes
    callback = function()
        local ok = pcall(vim.treesitter.start)
    end,
})
