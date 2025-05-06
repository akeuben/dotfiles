require("oil").setup()

vim.keymap.set("n", "<leader>fp", "<CMD>Oil<CR>", { desc = "Open parent directory" })
