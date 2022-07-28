require('nvim-treesitter.configs').setup {
    ensure_installed = { "html", "javascript", "lua", "python", "go", "hcl" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
