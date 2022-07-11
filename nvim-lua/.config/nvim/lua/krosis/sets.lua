vim.g.mapleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local options = {
    nu = true,
    rnu = true,
    mouse = "a",
    fileencoding = "utf-8",
    hidden = true,
    errorbells = false,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    hlsearch = false,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    sidescrolloff = 8,
    signcolumn = "yes",
    -- Give more space for displaying messages.
    cmdheight = 1,
    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience.
    updatetime = 50,
    timeoutlen = 250,
    colorcolumn = "80",
    clipboard = 'unnamedplus',
    splitbelow = true,
    splitright = true,
    cursorline = true,
    conceallevel = 0,
    completeopt = { "menuone", "noselect" },
    pumheight = 10,
    showcmd = false,
    showmode = false,
    showtabline = 1, --always show tabs
    laststatus = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
vim.opt.isfname:append("@-@")
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
