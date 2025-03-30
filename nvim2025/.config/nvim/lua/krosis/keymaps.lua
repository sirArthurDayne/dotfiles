local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "]k", "<cmd>cnext<CR>", opts)
vim.keymap.set("n", "[k", "<cmd>cprev<CR>", opts)
--vim.keymap.set("n", "<leader>k", "<cmd>copen<CR>", opts)
