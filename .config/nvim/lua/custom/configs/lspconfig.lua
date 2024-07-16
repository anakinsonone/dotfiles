local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local util = require "lspconfig/util"

local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local servers = { "tsserver", "tailwindcss", "eslint", "cssls", "jdtls", "jsonls", "clangd", "gopls" }

for _, lsp in ipairs(servers) do
  if lsp == "tsserver" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        preferences = {
          disableSuggestions = true,
        }
      },
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        }
      }
    }
  elseif lsp == "clangd" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      }, }
  elseif lsp == "rust_analyzer" then
    lspconfig["rust_analyzer"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ['rust_analyzer'] = {
          cargo = {
            allFeatures = true,
          }
        }
      }
    }
  elseif lsp == "jdtls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "java" },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
