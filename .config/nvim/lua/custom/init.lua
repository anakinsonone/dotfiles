local vim = vim
local api = vim.api
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Enable folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Reload buffer when file changes on disk
opt.autoread = true
api.nvim_command('autocmd CursorHold * checktime')

-- Show multiple statuslines if there are more than one windows
-- opt.ls = 1

-- Set line number by default
opt.nu = true
opt.relativenumber = true

-- set default tab to 2
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.hlsearch = false
opt.incsearch = true

-- opt.termguicolors = true

opt.scrolloff = 8
-- opt.colorcolumn = "80"

-- highlight search term
opt.hlsearch = true

-- opt.list = true
-- opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', eol = '󱞥' }

-- Highlight when yanking text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
