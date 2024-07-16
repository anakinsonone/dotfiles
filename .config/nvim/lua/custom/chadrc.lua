---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "one_light", "tokyonight" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    lazyload = true
  },

  telescope = {
    style = "bordered", -- borderless / bordered
    sorting_strategy = "descending",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
      },
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
