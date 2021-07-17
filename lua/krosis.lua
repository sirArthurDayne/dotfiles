local action_state = require('telescope.actions.state') --runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        selection_caret = "> ",
        mappings = {
            i = {
                ["<c-l>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        }
    }
}
--require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
