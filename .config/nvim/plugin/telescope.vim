"TELESCOPE remaps for usage
lua require("krosis")
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-n> :lua require('krosis.telescope').file_browser()<CR>
nnoremap <leader>gb :lua require('krosis.telescope').git_branches() <CR>
nnoremap <C-_> <cmd>lua require('krosis.telescope').current_buffer()<CR>
" nnoremap <F6> <cmd>lua require('krosis.telescope').get_dotfiles()<CR>
nnoremap <leader>ph <cmd>lua require('krosis.telescope').help_tags()<CR>
"easy source lua package
nnoremap <F4> :lua package.loaded.krosis = nil <CR>:source ~/Appdata/Local/nvim/init.vim <CR>
