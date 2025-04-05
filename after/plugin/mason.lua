require('mason').setup()
require("mason-lspconfig").setup()
require("lspconfig").clangd.setup{}

-- Completion setup
local cmp = require'cmp'
cmp.setup({
    sources = {
        { name = "luasnip", option = { show_autosnippets = true } },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "neorg" },
        { name = "path" },
    },
    mapping = {
        -- Tab autocomplete
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif lsnip.expand_or_jumpable() then
                lsnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif lsnip.jumpable(-1) then
                lsnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter to complete
        ["<C-y>"] = cmp.mapping.confirm({ select = false }), -- Ctrl + Y to complete too
        ["<C-l>"] = cmp.mapping(function(fallback) -- Move choice forward
            if lsnip.choice_active() then
                lsnip.change_choice()
            else
                fallback()
            end
        end),
        ["<C-h>"] = cmp.mapping(function(fallback) -- Move choice backward
            if lsnip.choice_active() then
                lsnip.change_choice(-1)
            else
                fallback()
            end
        end),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- Expands snippets
    snippet = {
        expand = function(args) lsnip.lsp_expand(args.body) end,
    },
})
