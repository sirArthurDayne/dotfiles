local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', { clear = true })
autocmd('TextYankPost', {
    group = yank_group,
    desc = "Highlight selection on Yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.cmd([[
    augroup Krosis
        autocmd!
        autocmd InsertEnter * norm zz
    augroup END
]])
