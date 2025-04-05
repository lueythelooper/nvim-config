-- Note, setting the mapleader in this lua does not take effect
-- until something is mapped
vim.g.mapleader = " "

print ("LueyTheLooper neovim config")
require('plugins')

vim.cmd("colorscheme vscode")

-- Map keys
local builtin = require('telescope.builtin')
vim.keymap.set( "n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- Set vim options
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true
