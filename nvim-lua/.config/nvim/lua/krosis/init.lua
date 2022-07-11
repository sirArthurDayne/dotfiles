require("krosis.sets")
require("krosis.packer")
require("krosis.keymaps")
require("krosis.telescope-config")
require("krosis.toggleterm")
require("krosis.nvim-autopairs")

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
            timeout = 40,
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

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
