local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.git_files, { desc = 'Telescope find files in Git' })
vim.keymap.set('n', '<leader>pp', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
