require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

local function compile_and_run_c()
	-- Get the full path of the current buffer
	local current_file = vim.fn.expand("%:p")
	local directory_path = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t:r") -- Extract file name without extension

	-- Compile the C program
	local compile_command = "gcc " .. current_file .. " -o " .. directory_path .. "/" .. file_name
	os.execute(compile_command)

	-- Run the compiled program with input from input.txt and output to output.txt
	local run_command = directory_path
		.. "/"
		.. file_name
		.. " < "
		.. directory_path
		.. "/input.txt > "
		.. directory_path
		.. "/output.txt"
	os.execute(run_command)
end

local function compile_and_run_cpp()
	-- Get the full path of the current buffer
	local current_file = vim.fn.expand("%:p")
	local directory_path = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t:r") -- Extract file name without extension

	-- Compile the C++ program
	local compile_command = "g++ " .. current_file .. " -o " .. directory_path .. "/" .. file_name
	os.execute(compile_command)

	-- Run the compiled program with input from input.txt and output to output.txt
	local run_command = directory_path
		.. "/"
		.. file_name
		.. " < "
		.. directory_path
		.. "/input.txt > "
		.. directory_path
		.. "/output.txt"
	os.execute(run_command)
end

local function compile_and_run_java()
	-- Get the full path of the current buffer
	local current_file = vim.fn.expand("%:p")
	local directory_path = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t:r") -- Extract file name without extension

	-- Compile the Java program
	local compile_command = "javac " .. current_file
	os.execute(compile_command)

	-- Run the compiled program with input from input.txt and output to output.txt
	local run_command = "java -classpath "
		.. directory_path
		.. " "
		.. file_name
		.. " < "
		.. directory_path
		.. "/input.txt > "
		.. directory_path
		.. "/output.txt"
	os.execute(run_command)
end

-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<F4>", compile_and_run_c, { desc = "Compile & Run C" })
map("n", "<F5>", compile_and_run_cpp, { desc = "Compile & Run C++" })
map("n", "<F6>", compile_and_run_java, { desc = "Compile & Run Java" })

-- insert mode
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- visual mode

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

-- nvim-dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue the debugger" })

-- floating diagnostics
map("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, { desc = "Go to previous diagnostic" })
map("n", "]d", function()
	vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, { desc = "Go to previous diagnostic" })
