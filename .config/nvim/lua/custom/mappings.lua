---@type MappingsTable
local M = {}

local function compile_and_run_c()
  -- Get the full path of the current buffer
  local current_file = vim.fn.expand('%:p')
  local directory_path = vim.fn.expand('%:p:h')
  local file_name = vim.fn.expand('%:t:r') -- Extract file name without extension

  -- Compile the C program
  local compile_command = 'gcc ' .. current_file .. ' -o ' .. directory_path .. '/' .. file_name
  os.execute(compile_command)

  -- Run the compiled program with input from input.txt and output to output.txt
  local run_command = directory_path ..
      '/' .. file_name .. ' < ' .. directory_path .. '/input.txt > ' .. directory_path .. '/output.txt'
  os.execute(run_command)
end

local function compile_and_run_cpp()
  -- Get the full path of the current buffer
  local current_file = vim.fn.expand('%:p')
  local directory_path = vim.fn.expand('%:p:h')
  local file_name = vim.fn.expand('%:t:r') -- Extract file name without extension

  -- Compile the C++ program
  local compile_command = 'g++ ' .. current_file .. ' -o ' .. directory_path .. '/' .. file_name
  os.execute(compile_command)

  -- Run the compiled program with input from input.txt and output to output.txt
  local run_command = directory_path ..
      '/' .. file_name .. ' < ' .. directory_path .. '/input.txt > ' .. directory_path .. '/output.txt'
  os.execute(run_command)
end

local function compile_and_run_java()
  -- Get the full path of the current buffer
  local current_file = vim.fn.expand('%:p')
  local directory_path = vim.fn.expand('%:p:h')
  local file_name = vim.fn.expand('%:t:r') -- Extract file name without extension

  -- Compile the Java program
  local compile_command = 'javac ' .. current_file
  os.execute(compile_command)

  -- Run the compiled program with input from input.txt and output to output.txt
  local run_command = 'java -classpath ' ..
      directory_path .. ' ' .. file_name .. ' < ' .. directory_path .. '/input.txt > ' .. directory_path .. '/output.txt'
  os.execute(run_command)
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle Transparency",
    },
    ["<F5>"] = { compile_and_run_cpp, "Compile & Run C++", opts = { noremap = true, silent = true } },
    ["<F6>"] = { compile_and_run_c, "Compile & Run C", opts = { noremap = true, silent = true } },
    ["<F4>"] = { compile_and_run_java, "Compile & Run Java", opts = { noremap = true, silent = true } },
    ["="] = { "<cmd>vertical resize +5<cr>", "Increase Window Width" },
    ["-"] = { "<cmd>vertical resize -5<cr>", "Decrease Window Width" },
    ["+"] = { "<cmd>horizontal resize +2<cr>", "Increase Window Height" },
    ["_"] = { "<cmd>horizontal resize -2<cr>", "Decrease Window Height" },
    ["n"] = { "nzzzv", "Keep search term in middle" },
    ["N"] = { "Nzzzv", "Keep search term in middle" },
    ["<leader>y"] = { "+y", "Yank into system register" },
    ["<leader>Y"] = { "+Y", "Yank into system register" },
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds"
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Open all folds"
    },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move Selection Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move Selection Up" },
    ["<leader>y"] = { "+y", "Yank into system register" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

M.noice = {
  plugin = true,
  n = {
    ["<leader>dn"] = {
      "<cmd> NoiceDismiss <CR>",
      "Dismiss Notification"
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require(
          'crates'
        ).upgrade_all_crates()
      end,
      "Update crates"
    }
  }
}

return M
