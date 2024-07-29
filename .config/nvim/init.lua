require("sakelkar.options")

require("sakelkar.keymaps")
require("sakelkar.plugins")
require("sakelkar.colorscheme")
require("sakelkar.cmp")
require("sakelkar.nvim-cmp")
require("sakelkar.telescope")
require("sakelkar.treesitter")
require("sakelkar.autopairs")
require("sakelkar.comment")
require("sakelkar.gitsigns")
require("sakelkar.nvim-tree")
--require("sakelkar.bufferline")
require("sakelkar.lualine")
require("sakelkar.toggleterm")
require("sakelkar.project")
require("sakelkar.impatient")
require("sakelkar.indentline")
require("sakelkar.alpha")
require("sakelkar.lsp")
require("sakelkar.symbol-outline")
require("lsp_lines").setup()
--require("mini.completion").setup()
--require("nvim-web-devicons").setup()
----require'nvim-tree'.setup {}
--require'nvim-treesitter.configs'.setup {
--  refactor = {
--    highlight_definitions = {
--      enable = true,
--      -- Set to false if you have an `updatetime` of ~100.
--      clear_on_cursor_move = true,
--    },
--  },
--}
--require'nvim-treesitter.configs'.setup {
--  refactor = {
--    highlight_current_scope = { enable = true },
--  },
--}
--require'nvim-treesitter.configs'.setup {
--  refactor = {
--    smart_rename = {
--      enable = true,
--      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
--      keymaps = {
--        smart_rename = "grr",
--      },
--    },
--  },
--}
--require'nvim-treesitter.configs'.setup {
--  refactor = {
--    navigation = {
--      enable = true,
--      -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
--      keymaps = {
--        --goto_definition = "gnd",
--        --list_definitions = "gnD",
--        --list_definitions_toc = "gO",
--        --goto_next_usage = "<a-*>",
--        --goto_previous_usage = "<a-#>",
--      },
--    },
--  },
--}
--require'cmp'.setup {
--  sources = {
--    { name = 'nvim_lsp_signature_help' }
--  }
--}
--
--local lspconfig = require("lspconfig")
--local navic = require("nvim-navic")
--
--lspconfig.clangd.setup {
--    on_attach = function(client, bufnr)
--        navic.attach(client, bufnr)
--    end
--}
--
--lspconfig.gopls.setup({
--  on_attach = function(c, b)
--    navic.attach(c, b)
--  end,
--  settings = {
--    gopls = {
--      hints = {
--        assignVariableTypes = true,
--        compositeLiteralFields = true,
--        compositeLiteralTypes = true,
--        constantValues = true,
--        functionTypeParameters = true,
--        parameterNames = true,
--        rangeVariableTypes = true,
--      },
--    },
--  },
--})
--
