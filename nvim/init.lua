require("config.options")
require("config.keymaps")
require("config.lsp")
require("config.autocmds")
require("config.usercmds")

require("config.pack")

vim.cmd.colorscheme("catppuccin")

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("oil").setup()

require("plugins.fzf")
require("plugins.blink")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.treesitter")
require("plugins.obsidian")
