local autopairs_statusOk, npairs = pcall(require, "nvim-autopairs")
if not autopairs_statusOk then
    return
end

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
        javascript = {},
    },
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
        map = "<M-e>",
        keys = "qwertyuiopasdfghjklzxcvbnm",
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        offset = 0,
        chars = {"{", "[", "(", '"', "'" },
        highlight = "PmenuSel",
        highlight_grey = "Comment",
        check_comma = true,
    },
})

local cmp_autopairs_statusOk, cmp_autopairs = pcall(require,"nvim-autopairs.completion.cmp")
if not cmp_autopairs_statusOk then
    return
end
local cmp_statusOk, cmp = pcall(require, "cmp")
if not cmp_statusOk then
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
