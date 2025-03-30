return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            require("telescope").setup {
                pickers = {
                    help_tags = {
                        theme = "ivy"
                    }
                },
                extensions = {
                    fzf = {},
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    }
                }
            }
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<C-h>", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<C-f>", builtin.git_files, { desc = "Telescope git repo" })
            vim.keymap.set("n", "<space>n", function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config") })
                end,
                { desc = "Edit neovim files" })
        end
    }
}
