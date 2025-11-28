-- Set the neovim mapleader
vim.g.mapleader = " "

-- Load all of the lazy configurations. The lazy will be installed per the config in config.lazy
-- which was taken from the lazy.nvim documentation site
require("config.lazy")

-- Set the vim colorscheme to vscode, installed in the lazy misc modules configuration
vim.cmd('colorscheme vscode')

-- Set vim options for shiftwidth and tabstop
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
