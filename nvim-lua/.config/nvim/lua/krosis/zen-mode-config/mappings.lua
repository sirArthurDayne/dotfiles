local Remaps = require("krosis.keymaps")
local keymap = Remaps.keymap

keymap("n", "<C-z>", ":ZenMode<CR>", Remaps.opts)
