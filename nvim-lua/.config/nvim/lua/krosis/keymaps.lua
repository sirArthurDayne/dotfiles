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


keymap("i", "jk", "<ESC>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
--better find&replace in file
keymap("n", "S", ":%s/<C-r><C-w>//g<left><left><left>", opts)
--better entire line Up or Down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K",":m '<-2<CR>gv=gv", opts)
keymap("n", "<leader>j",":m .+1<CR>==", opts)
keymap("n", "<leader>k",":m .-2<CR>==", opts)
-- keep cursor at center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)
-- undo break points
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "[", "[<C-g>u", opts)

return M
