-- lua/plugins/nvim-cmp.lua (or similar file in your plugins directory)

return {
  -- nvim-cmp plugin
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter', -- Load nvim-cmp when entering insert mode

  -- Dependencies for nvim-cmp
  dependencies = {
    'L3MON4D3/LuaSnip', -- Snippet engine
    'saadparwaiz1/cmp_luasnip', -- nvim-cmp source for LuaSnip
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for LSP
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
    'hrsh7th/cmp-path', -- nvim-cmp source for file paths
    'rafamadriz/friendly-snippets', -- Collection of common snippets
  },

  -- Configuration for nvim-cmp
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- Load friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- Setup LSP capabilities for nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Example for setting up an LSP server with nvim-cmp capabilities
    -- require('lspconfig').pyright.setup({
    --   capabilities = capabilities,
    -- })
  end,
}
