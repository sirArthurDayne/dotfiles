" Welcome!, Welcome! to..
" __                        .__              .__
"|  | _________  ____  _____|__| _________  _|__| ____________   ____
"|  |/ /\_  __ \/  _ \/  ___/  |/  ___/\  \/ /  |/     \_  __ \_/ ___\
"|    <  |  | \(  <_> )___ \|  |\___ \  \   /|  |  Y Y  \  | \/\  \___
"|__|_ \ |__|   \____/____  >__/____  >  \_/ |__|__|_|  /__|    \___  >
"     \/                  \/        \/                \/            \/
" Filename: init.vim
" Github: https://github.com/sirArthurDayne/dotfiles
" Maintainer: sirArthurDayne/krosis
" **DISCLAMER**:My config should be the same i use on Powershell Windows (i Hope...)

if has('win32')
    call plug#begin('~/Appdata/Local/nvim/plugged')
elseif has('unix')
    call plug#begin('~/.vim/plugged')
endif
    Plug 'tpope/vim-fugitive'                                "Git Integration on vim
if has("nvim")
    "telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "telescope extensions
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    "tree-sitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    "LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'onsails/lspkind-nvim'
    Plug 'tami5/lspsaga.nvim', { 'branch':'main' }
    Plug 'hrsh7th/nvim-cmp', { 'branch':'main' }
    Plug 'hrsh7th/cmp-nvim-lsp', { 'branch':'main' }
    Plug 'hrsh7th/cmp-buffer', { 'branch':'main' }
    Plug 'hrsh7th/cmp-path', { 'branch':'main' }
    Plug 'hrsh7th/cmp-nvim-lua', { 'branch':'main' }
    " Plug 'tzachar/cmp-tabnine', { 'do': 'powershell ./install.ps1' }
    " autopairs
    Plug 'windwp/nvim-autopairs'
    " snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    "Comments
    Plug 'numToStr/Comment.nvim'
    "Statusline
    Plug 'hoob3rt/lualine.nvim'
    "term support
    Plug 'akinsho/toggleterm.nvim'
    "TODO: notifications
endif
"themes
Plug 'dikiaap/minimalist'                                "main theme
Plug 'ayu-theme/ayu-vim'                                 "second theme
Plug 'sainnhe/gruvbox-material'                          "gruvbox theme
call plug#end()

"-----Extra funcionality
function! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

"allows for cut empty whitespace from endlines
augroup KROSIS
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

"better yanking experience(NEED UPDATE Neovim)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END

"----Cheatsh trick
function Cheat(query)
  let query = 'cheat.sh/' . a:query
  execute 'split | term curl ' . query
  execute 'resize ' . string(&lines/3)
endfunction

command! -nargs=1 CheatSh call Cheat(<q-args>)
nnoremap <leader>ch :CheatSh <C-R>=&filetype<CR>/
