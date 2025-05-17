return {
    {
        "folke/noice.nvim",
        enabled = true,
        event = "VeryLazy",
        dependencies = {
            {
                "MunifTanjim/nui.nvim",
                commit = "8d3bce9764e627b62b07424e0df77f680d47ffdb",
            }
        },
        config = function()
            local noice = require("noice")

            noice.setup({
                cmdline = { enabled = true, view = "cmdline_popup" },
                views = {
                    cmdline_popup = {
                        position = {
                            row = 5,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 8,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                },
                messages = { enabled = false, },
                notify = { enabled = false, },
                health = { checker = false, },
                popupmenu = { enabled = true, },
                signature = { enabled = false, },
            })
        end
    }
}
