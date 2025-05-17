return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'andrew-george/telescope-themes' },
        },
        config = function()
            require("telescope").setup {
                pickers = {
                    help_tags = {
                        theme = "ivy"
                    },
                    keymaps = {
                        theme = "ivy"
                    },
                },
                extensions = {
                    fzf = {},
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                    themes = {
                        enable_preview = true,
                        enable_live_preview = true,
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
                        },
                    }
                }
            }
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "themes")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<space>h", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<C-f>", builtin.git_files, { desc = "Telescope git repo" })
            vim.keymap.set("n", "<leader>m", builtin.man_pages, { desc = "Search man pages" })
            vim.keymap.set("n", "<leader>tc", "<cmd>Telescope themes<CR>", { desc = "[t]elescope [c]olorscheme" })
            vim.keymap.set("n", "<space>n", function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config") })
                end,
                { desc = "Edit neovim files" })
        end
    }
}
