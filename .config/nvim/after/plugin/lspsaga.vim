if !exists('g:loaded_lspsaga') | finish | endif

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent>gx <Cmd>Lspsaga signature_help<CR>
nnoremap <silent>gr <Cmd>Lspsaga rename<CR>
nnoremap <silent>gp <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gD :Lspsaga preview_definition<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

augroup lspsaga_filetypes
  autocmd!
  autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
augroup END
