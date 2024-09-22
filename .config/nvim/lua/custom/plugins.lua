local plugins = {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    event = "VeryLazy",
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require('render-markdown').setup({
        enabled = true,
        debounce = 100,
      })
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

}
return plugins
