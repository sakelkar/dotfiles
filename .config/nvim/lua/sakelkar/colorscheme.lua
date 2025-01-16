-- local colorscheme = "darkplus"
local colorscheme = "zephyr"
vim.g.onedarker_italic_keywords = false
vim.g.onedarker_italic_functions = false
vim.g.onedarker_italic_comments = true
vim.g.onedarker_italic_loops = false
vim.g.onedarker_italic_conditionals = false
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red', bg = 'red' })
-- Create an autocmd for ModeChanged event
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = 'i:n', -- Trigger when switching from Insert (i) to Normal (n) mode
  callback = function()
    vim.fn.matchadd('ExtraWhitespace', [[\s\+\%#\@<!$]])
  end,
})
