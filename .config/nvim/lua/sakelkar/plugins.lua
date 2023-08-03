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
  -- If you are using Packer
  use 'rmehri01/onenord.nvim'
  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  use "lunarvim/colorschemes"
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use "lunarvim/lunar.nvim"
  use "marko-cerovac/material.nvim"
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use { "cormacrelf/vim-colors-github" }
  use 'tanvirtin/monokai.nvim'
  use 'https://gitlab.com/__tpb/monokai-pro.nvim'

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
	use({
	  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	  config = function()
		require("lsp_lines").setup()
	  end,
	})

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

  use "jbyuki/venn.nvim"

  -- Packer
--  use({
--    "jackMort/ChatGPT.nvim",
--      config = function()
--        require("chatgpt").setup({
--          -- optional configuration
--        })
--      end,
--      requires = {
--        "MunifTanjim/nui.nvim",
--        "nvim-lua/plenary.nvim",
--        "nvim-telescope/telescope.nvim"
--      }
--  })
--    use({
--        "utilyre/barbecue.nvim",
--        tag = "*",
--        requires = {
--            "SmiteshP/nvim-navic",
--            "nvim-tree/nvim-web-devicons", -- optional dependency
--        },
--        after = "nvim-web-devicons", -- keep this if you're using NvChad
--        config = function()
--        require("barbecue").setup({
--                                      theme = {
--                                        -- this highlight is used to override other highlights
--                                        -- you can take advantage of its `bg` and set a background throughout your winbar
--                                        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
--                                        normal = { fg = "#c0caf5" },
--
--                                        -- these highlights correspond to symbols table from config
--                                        ellipsis = { fg = "#737aa2" },
--                                        separator = { fg = "#737aa2" },
--                                        modified = { fg = "#737aa2" },
--
--                                        -- these highlights represent the _text_ of three main parts of barbecue
--                                        dirname = { fg = "#737aa2" },
--                                        basename = { bold = true },
--                                        context = {},
--
--                                        -- these highlights are used for context/navic icons
--                                        context_file = { fg = "#ac8fe4" },
--                                        context_module = { fg = "#ac8fe4" },
--                                        context_namespace = { fg = "#ac8fe4" },
--                                        context_package = { fg = "#ac8fe4" },
--                                        context_class = { fg = "#ac8fe4" },
--                                        context_method = { fg = "#ac8fe4" },
--                                        context_property = { fg = "#ac8fe4" },
--                                        context_field = { fg = "#ac8fe4" },
--                                        context_constructor = { fg = "#ac8fe4" },
--                                        context_enum = { fg = "#ac8fe4" },
--                                        context_interface = { fg = "#ac8fe4" },
--                                        context_function = { fg = "#ac8fe4" },
--                                        context_variable = { fg = "#ac8fe4" },
--                                        context_constant = { fg = "#ac8fe4" },
--                                        context_string = { fg = "#ac8fe4" },
--                                        context_number = { fg = "#ac8fe4" },
--                                        context_boolean = { fg = "#ac8fe4" },
--                                        context_array = { fg = "#ac8fe4" },
--                                        context_object = { fg = "#ac8fe4" },
--                                        context_key = { fg = "#ac8fe4" },
--                                        context_null = { fg = "#ac8fe4" },
--                                        context_enum_member = { fg = "#ac8fe4" },
--                                        context_struct = { fg = "#ac8fe4" },
--                                        context_event = { fg = "#ac8fe4" },
--                                        context_operator = { fg = "#ac8fe4" },
--                                        context_type_parameter = { fg = "#ac8fe4" },
--                                      },
--                                    })
--        end,
--        })
  use {
    "SmiteshP/nvim-navbuddy",
    requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",        -- Optional
        "nvim-telescope/telescope.nvim" -- Optional
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
