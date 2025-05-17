local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "]k", "<cmd>cnext<CR>", { desc = "move to next element in quickfix list" })
vim.keymap.set("n", "[k", "<cmd>cprev<CR>", { desc = "move to previous element in quickfix list" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual selection" })
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "replace word under cursos in entire file" })
vim.keymap.set("n", "<leader>fp", function()
    local file_path = vim.fn.expand("%:~") -- get the filepath relative to $HOME
    vim.fn.setreg("+", file_path)          -- copy the filepath to the clipboard
    print("filepath copy to clipboard: " .. file_path)
end, { desc = "copy filepath to clipboard" })
