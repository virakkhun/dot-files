-- keymaps
local opt = {
	noremap = true,
	silent = true,
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>s", ":silent! w<CR>", opt)
vim.keymap.set("n", "<leader>cs", ":nohls<CR>", opt)
vim.keymap.set("n", "<leader>M", ":Mason<CR>", opt)
vim.keymap.set("n", "Q", ":q!<CR>", opt)
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })
vim.keymap.set("v", ",", "<Esc>")
vim.keymap.set("n", "<leader>v", ":vs<CR>", opt)
vim.keymap.set("n", "<leader>vs", "<C-W>s", opt)

-- keymaps:lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opt)
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opt)
vim.keymap.set("n", "<leader>ca", ":FzfLua lsp_code_actions previewer=codeaction_native<CR>", opt)
vim.keymap.set("n", "<leader>gr", ":FzfLua lsp_references<CR>", opt)

-- keymaps:buffer
vim.keymap.set("n", "<leader>]", ":bn<CR>", opt)
vim.keymap.set("n", "<leader>[", ":bp<CR>", opt)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opt)

-- keymaps:word selection
vim.keymap.set("n", '<leader>"', "vaw", { noremap = true, silent = true, desc = "Surround a word" })

-- keymaps:window
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- keymaps:explorer
vim.keymap.set("n", "<leader>e", ":Oil<CR>", opt)

-- keymaps:fzf-lua
local mappings = {
	{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Find word" },
	{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Live greping" },
	{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "List all keymaps" },
	{ "<leader><leader>", "<cmd>FzfLua files<cr>", desc = "Find files" },
	{ "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "List current buffers opened" },
}

for _, map in ipairs(mappings) do
	vim.keymap.set("n", map[1], map[2], { desc = table.insert(opt, { desc = map.desc }) })
end

-- keymaps:terminal
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("belowright 12split")
	vim.cmd("set winfixheight")
	vim.cmd("set nonumber")
	vim.cmd("set norelativenumber")
	vim.cmd("set statuscolumn=")
	vim.cmd("term")
	vim.cmd("startinsert")
end, { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "Exit terminal", noremap = true, silent = true })

-- keymaps:diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- keymaps:obsidian
vim.keymap.set("n", "<leader>ow", "<cmd>Obsidian workspace<CR>")
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>")
vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian today<CR>")
vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday<CR>")
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<CR>")
vim.keymap.set("n", "<leader>oq", "<cmd>Obsidian quick_switch<CR>")
