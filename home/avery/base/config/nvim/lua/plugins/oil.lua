require("oil").setup({
    view_options = {
        is_hidden_file = function(name, buffer)
            return name ~= ".." and vim.startswith(name, ".")
        end,
    }
})

vim.keymap.set("n", "<leader>fp", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
