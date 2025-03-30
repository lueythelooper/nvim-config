-- Note, setting the mapleader in this lua does not take effect
-- until something is mapped
vim.g.mapleader = " "
vim.keymap.set( "n", "<leader>pv", vim.cmd.Ex)

print ("LueyTheLooper neovim config")
require('plugins')

vim.cmd("colorscheme vscode")
