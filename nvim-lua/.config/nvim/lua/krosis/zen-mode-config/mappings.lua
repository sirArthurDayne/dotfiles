local Remaps = require("krosis.config.keymaps")
local keymap = Remaps.keymap

keymap("n", "<C-z>", ":ZenMode<CR>", Remaps.opts)
