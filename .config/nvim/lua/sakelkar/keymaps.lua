M  = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
-- Windows/Splits creation
keymap("n", "sv", "<C-w>v", opts) -- split window vertically
keymap("n", "sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "sx", ":close<CR>", opts) -- close current split window

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

--Buffers
keymap("n", "bh", ":bNext<CR>", opts)
keymap("n", "bl", ":bprevious<CR>", opts)

-- Tabs --
keymap("n", "tn", ":tabnew<CR>", opts) -- open new tab
keymap("n", "tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "th", ":tabn<CR>", opts) --  go to next tab
keymap("n", "tl", ":tabp<CR>", opts) --  go to previous tab
--keymap("n", "<m-t>", ":tabnew %<cr>", opts)
--keymap("n", "<m-y>", ":tabclose<cr>", opts)
--keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

---------------------
-- General Keymaps
---------------------
-- use jk to exit insert mode
keymap("i", "jk", "<ESC>", opts)
-- clear search highlights
keymap("n", "nh", ":nohl<CR>", opts)
-- delete single character without copying into register
keymap("n", "x", '"_x', opts)
-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)
----------------------
-- Plugin Keybinds
----------------------
--Plugin Keymap
keymap("n", "<leader>;", ":Alpha<CR>", opts)  --NvimTree explorer toggle
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)  --NvimTree explorer toggle
keymap("n", "<leader>s", ":SymbolsOutline<CR>", opts)  --NvimTree explorer toggle

keymap("n", "<leader>ff", ":lua require('fzf-lua').files()<CR>", opts) --find files in current directory
keymap("n", "<leader>fb", ":lua require('fzf-lua').buffers()<CR>", opts) --find files in current directory
keymap("n", "<leader>ft", ":lua require('fzf-lua').tabs()<CR>", opts) --find files in current directory
keymap("n", "<leader>fs", ":lua require('fzf-lua').grep_cword()<CR>", opts) -- find string in current working directory as you type
keymap("n", "<leader>fS", ":lua require('fzf-lua').grep_cWORD()<CR>", opts) -- find string in current working directory as you type
keymap("n", "<leader>fl", ":lua require('fzf-lua').live_grep()", opts) -- find string under cursor in current working directory


function diffView_traceLine()
  -- Get current line number 
  local lineNum = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_exec(lineNum.."DiffviewFileHistory", {})
end

function diffView_traceCommit()
  local current_word = vim.call('expand','<cword>')
  --print("diffView_traceCommit")
  --local cmd = "DiffviewOpen "..current_word.."^!"
  --print(cmd)
  vim.api.nvim_exec("DiffviewOpen "..current_word.."^!", {})
end

keymap("n", "<leader>gcs", ":lua diffView_traceLine()<CR>", opts)
keymap("n", "<leader>gcd", ":lua diffView_traceCommit()<CR>", opts)
keymap("n", "<leader>gch", ":DiffviewFileHistory<CR>", opts) -- find string under cursor in current working directory
keymap("n", "<leader>gchf", ":DiffviewFileHistory %<CR>", opts) -- find string under cursor in current working directory

--keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts) --find files in current directory
--keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts) -- find string in current working directory as you type
--keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts) -- find string under cursor in current working directory
--keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- list open buffers in current neovim instance
--keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts) -- list available help tags


keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>ld", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>lh", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
return M
