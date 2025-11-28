return {
    "tpope/vim-fugitive",

    -- This function is executed after the plugin is loaded.
    config = function(plugin_spec, opts)
        vim.keymap.set("n", "<leader>gi", ":Git<CR>", { desc = "Open the vim fugitive git command" })
    end,
}
