local Remaps = require("krosis.keymaps")
local keymap = Remaps.keymap

keymap("n", "<C-g>s", ":G<CR>", Remaps.opts)
keymap("n", "<C-g>l", ":Gclog<CR>", Remaps.opts)
-- diffget to the right
keymap("n", "<C-g>h", ":diffget //3<CR>", Remaps.opts)
-- diffget to the left
keymap("n", "<C-g>f", ":diffget //2<CR>", Remaps.opts)
