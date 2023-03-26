require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "vim", "help", "html", "javascript", "lua", "python", "go", "hcl", "terraform", "yaml" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
}
