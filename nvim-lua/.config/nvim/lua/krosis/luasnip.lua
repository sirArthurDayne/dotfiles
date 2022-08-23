local ls = require("luasnip")

ls.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
    ext_opts = nil,
}

--expand item or jump to the next within the snippets
vim.keymap.set({ "i" , "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})

--jump to previous item within the snippets
vim.keymap.set({ "i" , "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent = true})

-- TODO: add choice node keymap

--shortcut to source this file
local source_path="<cmd>source ~/.config/nvim/lua/krosis/luasnip.lua<CR>"
if vim.fn.has("win32") == 1 then
    source_path="<cmd>source ~/AppData/Local/nvim/lua/krosis/luasnip.lua<CR>"
end
vim.keymap.set("n", "<leader><leader>s", source_path)

--SNIPPETS
-- TODO: move this to another file
ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "-- this is an expansion BRO!!"),
    },
    lua = {},

}
