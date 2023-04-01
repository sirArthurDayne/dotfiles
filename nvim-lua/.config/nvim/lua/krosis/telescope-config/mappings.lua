local Remap = require("krosis.config.keymaps")
local keymap = Remap.keymap
keymap("n", "<C-p>", ":lua require('telescope.builtin').git_files()<CR>", Remap.opts)
keymap("n", "<F6>", ":lua require('krosis.telescope-config').get_dotfiles()<CR>", Remap.opts)
keymap("n", "<C-n>", ":lua require('krosis.telescope-config').file_browser()<CR>", Remap.opts)
keymap("n", "<leader>h", ":lua require('krosis.telescope-config').help_tags()<CR>", Remap.opts)
keymap("n", "<C-g>b", ":lua require('krosis.telescope-config').git_branches()<CR>", Remap.opts)
keymap("n", "<C-g>c", ":lua require('krosis.telescope-config').git_commits()<CR>", Remap.opts)
