if !exists('g:lspconfig')
    finish
endif

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local completion_lsp = require('completion')

local on_attach = function(client, bufferNumber)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufferNumber,...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufferNumber,...) end
    --mappings
    local options = { noremap = true, silent=true}
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
    --autoformat on saving
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end
    --autocomplete
    completion_lsp.on_attach(client, bufferNumber)
    --autocomplete devicons
    protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
      }
end
--lsp config
local goplsbin='/home/krosis/go/bin/gopls'
nvim_lsp.gopls.setup{
    cmd = {goplsbin,"serve"},
    filetypes = { "go", "gomod" },
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach
}
EOF
