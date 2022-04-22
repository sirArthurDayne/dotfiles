local treesitter_statusOk, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_statusOk then
    return
end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  autopairs = { enable = true },
  indent = {
    enable = false, disable = {},
  },
  textobjects = { enable = false },
  incremental_selection = { enable = true },
  ensure_installed = {
    "lua",
    "vim",
    "html",
    "css",
    "javascript",
    "c",
    "cpp"
  },
   context_commentstring = { enable = true },
   refactor = {
    highlight_definitions = {
      enable = true, -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    smart_rename = { enable = false},
    navigation = { enable = false},
  },
}
