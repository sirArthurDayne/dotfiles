require("krosis/treesitter")
require("krosis/telescope")
require("krosis/lsp")
require("krosis/lualine")
require("krosis/lspsaga")
require("krosis/luasnip")
require("krosis/toggleterm")
require("krosis/nvim-autopairs")
require("krosis/comment")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
