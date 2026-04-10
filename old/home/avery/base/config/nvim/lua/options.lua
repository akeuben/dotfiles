vim.g.mapleader = ' ';
vim.g.maplocalleader = ' ';

vim.opt.list = true;

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>');

vim.wo.number = true;

vim.o.smarttab = true;
vim.opt.cpoptions:append('I');
vim.o.expandtab = true;
vim.o.smartindent = true;
vim.o.autoindent = true;
vim.o.tabstop = 4;
vim.o.softtabstop = 4;
vim.o.shiftwidth = 4;

vim.o.breakindent = true;
vim.o.undofile = true;

vim.wo.signcolumn = 'yes';
vim.wo.relativenumber = true;

vim.o.termguicolors = true;

vim.api.nvim_create_autocmd("FileType", {
    desc = "remove formatoptions",
    callback = function()
      vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})
