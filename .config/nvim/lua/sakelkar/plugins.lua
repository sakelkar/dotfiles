local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim"           --Have packer manage itself

  --Basic stiff 
  use "christianchiarulli/lua-dev.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"            --Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"            --Commenting
  use "kyazdani42/nvim-web-devicons"     --Icons
  use "kyazdani42/nvim-tree.lua"         --File explorer
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {'simrat39/symbols-outline.nvim'}
  use "moll/vim-bbye"                    --Buffer bye
  --use "nvim-lualine/lualine.nvim"        --Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use "akinsho/toggleterm.nvim"          --Toggleterminal
  use "ahmedkhalf/project.nvim"          --Project
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim"

  -- Colorschemes
  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  use "lunarvim/colorschemes"
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use "lunarvim/lunar.nvim"
  use "marko-cerovac/material.nvim"
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-emoji"

  -- Snippet
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use "williamboman/nvim-lsp-installer"
  use "RRethy/vim-illuminate"
  use "ray-x/lsp_signature.nvim"

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls


  -- Fuzzy Finder/Telescope
  --use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use ({'romgrk/fzy-lua-native'})
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use "nvim-telescope/telescope.nvim"

  -- Syntax/Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use "windwp/nvim-ts-autotag"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use("szw/vim-maximizer") -- maximizes and restores current window
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

  use{'junegunn/fzf', run = './install --bin'}
  use{'ibhagwan/fzf-lua', requires = {'nvim-tree/nvim-web-devicons'}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
