"vertically center document when insert mode
autocmd InsertEnter * norm zz
"keep cursor at center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"My favorite mappings ^__^
let mapleader = " "
nnoremap <leader>vo :vsplit $MYVIMRC<CR>
inoremap jk <ESC>

"LEARN VIM -__-. arrow-keys is for cowards and normies
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

"quick line indentation
vmap < <gv
vmap > >gv
"better entire line Up or Down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"quick save
nnoremap <C-s> :w<CR>
"quick vsplit
nnoremap <leader>pv :wincmd v<CR>
"quick buffer movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
"rotate split
nnoremap <leader>r :wincmd r<CR>
"resize current buffer
nnoremap <Tab><Left> :vertical resize +5<CR>
nnoremap <Tab><Right> :vertical resize -5<CR>
"better find&replace in file
nnoremap S :%s/<C-r><C-w>//g<left><left><left>
"make yanking great again
nnoremap Y y$
