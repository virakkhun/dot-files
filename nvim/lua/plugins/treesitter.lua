local filetypes = {
	"vimdoc",
	"lua",
	"html",
	"htmlangular",
	"typescript",
	"javascript",
	"sql",
	"go",
	"php",
	"tsx",
	"jsx",
}

local function includes(tbl, value)
	for i = 1, #tbl do
		if tbl[i] == value then
			return true
		end
	end

	return false
end

vim.api.nvim_create_autocmd("FileType", {
	desc = "Set up nvim-treesitter highlighting and indentation",
	group = vim.api.nvim_create_augroup("treesitter-aud", { clear = true }),
	callback = function()
		local is_html_or_html_angular = includes(filetypes, vim.bo[0].filetype)
		if is_html_or_html_angular then
			vim.treesitter.start()
		end
	end,
})

-- In your configuration initialization
require("nvim-treesitter").setup()
