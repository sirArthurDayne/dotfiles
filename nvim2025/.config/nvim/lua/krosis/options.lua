local options = {
    nu = true,
    rnu = true,
    fileencoding = 'utf-8',
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    termguicolors = true,
    incsearch = true,
    hlsearch = false,
    scrolloff = 8,
    sidescrolloff = 8,
    updatetime = 50,
    splitbelow = true,
    splitright = true,
    cursorcolumn = true,
    timeoutlen = 250,
    completeopt = "menuone,noselect,noinsert",
    pumheight = 10,
    laststatus = 3,
    sessionoptions = "buffers,curdir,winsize",
    ignorecase = true,
    smartcase = true,
    swapfile = false,
    clipboard = "unnamedplus",
}
for k, v in pairs(options) do
    vim.opt[k] = v
end
vim.g.have_nerd_font = true
