require "nvchad.options"

local api = vim.api
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.cursorlineopt ='both' -- to enable cursorline!
opt.cursorline = true
api.nvim_set_hl(0, 'CursorLineNr', {fg = "#FF9E64"})

-- Enable folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Reload buffer when file changes on disk
opt.autoread = true
api.nvim_command "autocmd CursorHold * checktime"

-- Set line number by default
opt.nu = true
opt.rnu = true

-- set default tab to 2
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

-- highligh search
opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.colorcolumn = "80"

-- list characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "󱞥" }

-- Highlight when yanking text
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
