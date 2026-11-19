local nixInfo = require(vim.g.nix_info_plugin_name)
local base16colors = nixInfo(nil, "base16colors")

require("base16-colorscheme").setup(base16colors)
