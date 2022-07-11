local function current_buffer_number()
  return "﬘ " .. vim.api.nvim_get_current_buf()
end

local function current_working_dir()
  local cwd = string.sub(vim.fn.getcwd(), 12)
  return "~" .. cwd
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
          { "filename", path = 1, symbols = { modified = "[]", readonly = " " } },
          { "lsp_progress", display_components = { "lsp_client_name" } },
  },
      lualine_x = {{ "filetype", icon_only = true }},
      lualine_y = {
          { current_buffer_number },
      },
      lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1, symbols = { modified = "[]", readonly = " " } } },
    lualine_x = {'location'},
    lualine_y = { { current_buffer_number } },
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
