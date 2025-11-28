-- This configuration was taken from google AI recommended config, and I wrote setup based on the tree sitter documentation
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Ensures parsers are updated on install/update
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Configuration options go here
      ensure_installed = {
          'lua',
	  'cpp',
	  'python',
      },
      auto_install = true,

      highlight = {
	      enable = true,
      },
    })
  end,
}
