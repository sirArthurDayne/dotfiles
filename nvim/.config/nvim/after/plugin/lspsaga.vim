if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
    local saga = require('lspsaga')
    saga.init_lsp_saga{
        border_style = "round",
    }
EOF

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent>gs <Cmd>Lspsaga signature_help<CR>
nnoremap <silent>gr <Cmd>Lspsaga rename<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gD :Lspsaga preview_definition<CR>