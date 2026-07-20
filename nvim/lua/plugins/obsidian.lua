require("obsidian").setup({
	legacy_commands = false, -- this will be removed in 4.0.0
	workspaces = {
		{
			name = "personal",
			path = "~/notes/personal",
		},
		{
			name = "work",
			path = "~/notes/work",
		},
	},
	completion = {
		min_chars = 2,
	},
	picker = {
		name = "fzf-lua",
	},
})
