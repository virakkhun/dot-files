local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 18
config.line_height = 1.0
config.font = wezterm.font_with_fallback({
	{ family = "SF Mono" },
})

local function get_theme()
	if wezterm.gui then
		return wezterm.gui.get_appearance() == "Dark" and "catppuccin-mocha" or "catppuccin-latte"
	end

	return "tokyonight_night"
end

config.color_scheme = get_theme()

config.colors = {
	cursor_bg = "#7aa2f7",
	cursor_border = "#7aa2f7",
}

-- Map folder/project → icon
local icons = {
	["frontend"] = "", -- react
	["backend"] = "", -- server
	["api"] = "󰒋",
	["nvim"] = "",
	["dotfiles"] = "󱁿",
	["default"] = "",
}

local function get_icon(name)
	return icons[name] or icons["default"]
end

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane
	local cwd = pane.current_working_dir
	local title = cwd and basename(cwd.file_path) or pane.title
	local icon = get_icon(title)

	return {
		{ Text = " " .. icon .. " " .. title .. " " .. "✨" },
	}
end)

config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.SendString("clear\n"),
	},
	-- pane switching
	{
		key = "]",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "]",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "[",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "[",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "p",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- cursor movement
	{ key = "h", mods = "CMD", action = wezterm.action.SendKey({ key = "LeftArrow" }) },
	{ key = "j", mods = "CMD", action = wezterm.action.SendKey({ key = "DownArrow" }) },
	{ key = "k", mods = "CMD", action = wezterm.action.SendKey({ key = "UpArrow" }) },
	{ key = "l", mods = "CMD", action = wezterm.action.SendKey({ key = "RightArrow" }) },
}

return config
