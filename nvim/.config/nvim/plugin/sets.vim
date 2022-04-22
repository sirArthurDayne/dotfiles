"basic sets to survive
set exrc
set hidden
set noerrorbells
set clipboard+=unnamedplus

"cursor sets
set number relativenumber
set cursorline
set cursorcolumn
set signcolumn=yes
set colorcolumn=80
set scrolloff=8
set nowrap
set noshowmode

"better searching hightlighting
set incsearch
set nohlsearch
set smartcase
set completeopt=menuone,noinsert,noselect
set shortmess+=c
"better text completion
set wildmode=longest,list,full
set wildmenu

"history and intermediate files
set noswapfile
set nobackup
set nowritebackup
"set undodir=~/.config/nvim/undodir
"set undofile

"Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"better user experience
set updatetime=50
set timeoutlen=250
"better buffer-splitting
set splitbelow splitright
