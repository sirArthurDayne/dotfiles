require "krosis.telescope-config.mappings"
local telescope_built = require('telescope.builtin')

require("telescope").setup{
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = "λ ",
        selection_caret = "> ",
        mappings = {
            i = {
                --["<c-l>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
            }
        },
        extensions = {
            fzy_native = {
                fuzzy = true, --false will only do exact matching
                override_generic_sorter = false,
                override_file_sorter = true,
            },
            file_browser = {
                theme = "ivy",
                hidden = true,
            },
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case", -- this is default
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
    }
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"

local mappings = {}

function mappings.reload_modules()
	-- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
	-- awesome things.
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

mappings.grep_string = function ()
    local options = {
        prompt_title = "< GREP FOR >",
        search = vim.fn.input("Grep for > "),
        layout_config = {
            width = 0.5,
            height = 30,
            preview_width = 0.5
        },
    }
    telescope_built.grep_string(options)
end

mappings.current_buffer = function()
    local options = require('telescope.themes').get_dropdown({layout_config={height=20}, previewer=false})
    telescope_built.current_buffer_fuzzy_find(options)
end

mappings.get_dotfiles = function()
    local path = 'd:/Dev/Proyects/githubDownloads/dotfiles'
    if vim.fn.has("unix") then
        path = '~/dotfiles'
    end
    local options = {
        prompt_title = "< DOTFILES >",
        cwd=path,
        }
    telescope_built.git_files(options)
end


--works for powershell
local function set_background(content)
    if vim.fn.has("unix") then
        vim.fn.system("feh --bg-fill --no-fehbg " .. content)
    else
        vim.fn.system("pwsh -c {Set-WallPaper -Image '" .. content .. "' }")
    end
end

local function select_background(prompt_buffer, map)
    local function set_the_background(close)
        local content = require("telescope.actions.state").get_selected_entry(prompt_buffer)
        set_background(content.cwd .. "/" .. content.value) -- NOT TESTED
        if close then
            require("telescope.actions").close(prompt_buffer)
        end
    end
    --movements
    map("i", "<C-p>", function()
		set_the_background()
	end)

	map("i", "<CR>", function()
		set_the_background(true)
	end)
end

local function bg_selector(prompt, cwd)
    return function()
        require("telescope.builtin").git_files({
            prompt_title = prompt,
            cwd = cwd,
            previewer = false,
            layout_config  = {width = 0.5},
            attach_mappings = function(prompt_buffer, map)
                select_background(prompt_buffer,map)
                return true
            end,
        })
    end
end

local wallpaperPath = "D:/wallpapersPack"
if vim.fn.has("unix") then
    wallpaperPath = "~/wallpapers"
end
mappings.bg_selector = bg_selector("< BACKGROUND >", wallpaperPath)

mappings.git_commits = function()
    local options = {
        prompt_title = "< GIT COMMITS >",
        layout_config = {width = 0.65, height = 20, preview_width = 0.5},
    }
    telescope_built.git_commits(options)
end

mappings.git_branches = function()
    local options = {
        prompt_title = "< GIT BRANCHES >",
        layout_config = {width = 0.65, height = 20, preview_width = 0.5},
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
    local options = require('telescope.themes').get_ivy({prompt_title = "< BROWSER >", layout_config={height=20, width=0.75, preview_width=0.65}, hidden=true})
    require("telescope").extensions.file_browser.file_browser(options)
end

--help tags
mappings.help_tags = function()
    local options = require('telescope.themes').get_ivy({prompt_title = "< HELP TAGS >", layout_config={height=20}})
    telescope_built.help_tags(options)
end

return mappings
