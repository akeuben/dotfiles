require('base16-colorscheme').with_config({
    telescope = false,
    indentblankline = true,
    notify = true,
    ts_rainbow = true,
    cmp = true,
    illuminate = true,
    dapui = true,
})

require('base16-colorscheme').setup(nixCats.extra("base16colors"))
