return {
    "nvim-telescope/telescope.nvim",
    
    -- This function is executed after the plugin is loaded.
    config = function(plugin_spec, opts)
        vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>", { desc = "Run the git files command for telescope" })
        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Run the find files command for telescope" })
    end,
}
