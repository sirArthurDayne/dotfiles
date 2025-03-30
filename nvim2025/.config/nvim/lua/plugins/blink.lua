return {
    {
        'saghen/blink.cmp',
        enabled = false,
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },
        -- use a release tag to download pre-built binaries
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings

            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },
            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                nerd_font_variant = 'mono'
            },
            -- (Default) Only show the documentation popup when manually triggered
            completion = { menu = { border = "rounded" }, --[[ghost_text = { enabled = true, } ,--]] documentation = { auto_show = true } },
            signature = { enabled = true },
            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
