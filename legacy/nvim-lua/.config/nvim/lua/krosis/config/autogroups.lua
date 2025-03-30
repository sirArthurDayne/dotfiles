local augroup = vim.api.nvim_create_augroup
KrosisGroup = augroup('Krosis', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
        })
    end,
})

--vertically center document when insert mode
vim.cmd([[
    augroup Krosis
        autocmd!
        autocmd InsertEnter * norm zz
    augroup END
]])

vim.cmd([[
function! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction
augroup Jeremy
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
]])


-- resize splits if window got resized
autocmd( 'VimResized' , {
  group = augroup('resize_splits', {} ),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
