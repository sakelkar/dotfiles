local options = {
  --back and swapfile related
  backup = false,                          -- creates a backup file
  swapfile = false,                        -- creates a swapfile

  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  fileencoding = "utf-8",                  -- the encoding written to a file

  --tabs and indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  expandtab = true,                        -- convert tabs to spaces
  smartindent = true,                      -- make indenting smarter again
  autoindent = true,                        -- copy indent from current line when starting new one

  --line wrapping
  wrap = false,                            -- display lines as one long line

  -- search settings
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  
  --mouse and cursor
  cursorline = true,                       -- highlight the current line
  mouse = "a",                             -- allow the mouse to be used in neovim

  --line numbers
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  relativenumber = true,                   -- set relative numbered lines


  -- backspace
  backspace = "indent,eol,start",           -- allow backspace on indent, end of line or insert mode start position

  --windows split
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window

  --navigation
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                       -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  laststatus = 3,
  --showcmd = false,
  ruler = false,
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,

  --appearance 
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  --guifont = "monospace:h17",               -- the font used in graphical neovim applications
  title = true,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  pumheight = 10,                          -- pop up menu height
  showmode = true,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
}
vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
  stl = ' ',
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Lua initialization file
--vim.cmd [[colorscheme nightfly]]


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.fillchars.eob = " "
vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
vim.opt.fillchars = vim.opt.fillchars + "vertright: "
