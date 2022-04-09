local statusOk, toggleterm = pcall(require, "toggleterm")
if not statusOk then
    return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  direction = 'float', --options: 'vertical','float','horizontal','window'
  shade_terminals = true,
  shading_factor = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  shade_filetypes = {},
  hide_numbers = true, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true, -- close the terminal window when the process exits
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  -- shell = "pwsh.exe -Login -Interactive ",--change the default shell: vim.o.shell
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><leader>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><leader>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><leader>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><leader>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
