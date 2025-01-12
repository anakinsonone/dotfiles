-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = {
	"clangd",
	"cssls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"tailwindcss",
	"ts_ls",
}
local nvlsp = require("nvchad.configs.lspconfig")
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities
local on_init = nvlsp.on_init

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}
	vim.lsp.buf.execute_command(params)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
	if lsp == "ts_ls" then
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
		})
	elseif lsp == "clangd" then
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})
	else
		lspconfig[lsp].setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		})
	end
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
