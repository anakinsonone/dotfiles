local plugins = {
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require "custom.configs.neogit"
    end
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    cmd = {"RenderMarkdown"},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require('render-markdown').setup({})
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "tpope/vim-dadbod",
    event = "VeryLazy",
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    event = "VeryLazy",
  },

  {
    "kristijanhusak/vim-dadbod-completion",
    event = "VeryLazy",
  },

  {
    "mfussenegger/nvim-jdtls",
    event = "VeryLazy",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require("custom.configs.nvim-treesitter-context")
    end
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "mlaursen/vim-react-snippets",
    lazy = false,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "eslint-lsp",
        "gopls",
        "java",
        "jdtls",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "rust-analyzer",
        "sql",
        "tailwindcss-language-server",
        "typescript-language-server",
      }
    }
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "lua",
        "markdown",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      }
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      opts = require "plugins.configs.telescope"
      opts.defaults.layout_config.horizontal.prompt_position = "bottom"
      opts.defaults.sorting_strategy = "descending"
      opts.defaults.prompt_prefix = " "
      opts.defaults.selection_caret = " "
      opts.defaults.path_display = { "smart" }
    end

  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false }
  },

  -- {
  --
  --   "nvim-tree/nvim-tree.lua",
  --   opts = function ()
  --     opts = require "plugins.configs.nvimtree"
  --     opts.view.adaptive_size = true
  --     opts.view.side = "right"
  --
  --   end
  -- }

}
return plugins
