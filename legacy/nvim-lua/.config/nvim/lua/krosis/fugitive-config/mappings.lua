local Remaps = require("krosis.config.keymaps")
--git status
vim.keymap.set("n", "<C-g>s", vim.cmd.Git, Remaps.opts)
--git log
vim.keymap.set("n", "<C-g>l", vim.cmd.Gclog, Remaps.opts)
-- diffget to the right
vim.keymap.set("n", "<C-g>h", "<cmd>diffget //3<CR>", Remaps.opts)
-- diffget to the left
vim.keymap.set("n", "<C-g>f", "<cmd>diffget //2<CR>", Remaps.opts)
