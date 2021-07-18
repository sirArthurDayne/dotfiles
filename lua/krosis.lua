local action_state = require('telescope.actions.state') --runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
require('telescope').setup{
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = "$ ",
        selection_caret = "> ",
        mappings = {
            i = {
                ["<c-l>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        },
        extensions = {
            fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
            }
        }
    }
}
--require('telescope').load_extension('fzf')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('coc')

--remaps table
local mappings = {}

mappings.current_buffer = function()
    local options = require('telescope.themes').get_dropdown({layout_config={height=20}, previewer=false})
    require('telescope.builtin').current_buffer_fuzzy_find(options)
end

mappings.get_dotfiles = function()
    local options = {prompt_title = "< DOTFILES >", cwd="~/personal/dotfiles", hidden=true}
    require('telescope.builtin').git_files(options)
end

return mappings
