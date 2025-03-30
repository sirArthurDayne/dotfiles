local M = {}

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
M.opts = opts
M.term_opts = term_opts
M.keymap = keymap

function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")


vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("n", "Y", "yg$", opts)
--copy and paste without changing register
vim.keymap.set("x", "<leader>p", "\"_dP", opts)
--better find&replace in file
vim.keymap.set("n", "S", ":%s/<C-r><C-w>//g<left><left><left>", opts)
--better entire line Up or Down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K",":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "<leader>j",":m .+1<CR>==", opts)
vim.keymap.set("n", "<leader>k",":m .-2<CR>==", opts)
-- keep cursor at center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- undo break points
vim.keymap.set("i", ",", ",<C-g>u", opts)
vim.keymap.set("i", ".", ".<C-g>u", opts)
vim.keymap.set("i", "!", "!<C-g>u", opts)
vim.keymap.set("i", "[", "[<C-g>u", opts)

return M
