-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}
local highlights = require("configs.highlights")

M.base46 = {
	theme = "tokyonight",

	hl_override = highlights.override,
}

M.ui = {
	telescope = {
		style = "bordered", -- bordered/ borderless
	},

	statusline = {
		theme = "minimal",
		separator_style = "round",
	},

	tabufline = {
		order = { "buffers", "tabs", "btns", "treeOffset" },
	},
}

return M
