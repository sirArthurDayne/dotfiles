local action_state = require('telescope.actions.state') --runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
local telescope_built = require('telescope.builtin')
require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        selection_caret = "> ",
        mappings = {
            i = {
                ["<c-l>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        },
        extensions = {
            fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            }
            -- fzy_native = {
            -- override_generic_sorter = false,
            -- override_file_sorter = true,
            -- }
        }
    }
}
require('telescope').load_extension('fzf')
--require('telescope').load_extension('fzy_native')

--remaps table
local mappings = {}

mappings.current_buffer = function()
    local options = require('telescope.themes').get_dropdown({layout_config={height=20}, previewer=false})
    telescope_built.current_buffer_fuzzy_find(options)
end

mappings.get_dotfiles = function()
    local options = {prompt_title = "< DOTFILES >", cwd=vim.env.DOTFILES, hidden=true}
    telescope_built.git_files(options)
end

--add delete branch feature to git_branches
mappings.git_branches = function()
    local options = {
        attach_mappings = function(prompt_buffer, map)
            map('i', '<c-d>', require('telescope.actions').git_delete_branch)
            map('n', '<c-d>', require('telescope.actions').git_delete_branch)
            return true
        end
    }
    telescope_built.git_branches(options)
end

--file browser
mappings.file_browser = function()
    local options = require('telescope.themes').get_ivy({prompt_title = "< BROWSER >", layout_config={height=20}, hidden=true})
    telescope_built.file_browser(options)
end

--help tags
mappings.help_tags = function()
    local options = require('telescope.themes').get_ivy({prompt_title = "< HELP TAGS >", layout_config={height=20}})
    telescope_built.help_tags(options)
end

return mappings
