-- if vim.g.snippets ~= "luasnip" then
--     return
-- end

local ls = require("luasnip")
local types = require("luasnip.util.types")

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
if vim.fn.has("win32") then
    vim.keymap.set("n", "<F5>", "<cmd>source ~/AppData/Local/nvim/lua/krosis/luasnip.lua<CR>")
elseif vim.fn.has("unix") then
    vim.keymap.set("n", "<F5>", "<cmd>source ~/.config/nvim/lua/krosis/luasnip.lua<CR>")
end
--SNIPPETS
-- TODO: move this to another file

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "-- this is an expansion BRO!!"),
    },
    lua = {},

}
