local fn = vim.fn
local install_path = fn.stdpath('data').. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup { function(use)
	use('wbthomason/packer.nvim')
    -- colorscheme
    use { 'rose-pine/neovim', config = function() require("krosis.colors") end, }
    -- telescope
     use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } },
    }
     use { "nvim-telescope/telescope-file-browser.nvim" }
     use { "kyazdani42/nvim-web-devicons" }
     use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    -- TreeSitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
    }
    use { "windwp/nvim-autopairs" }
    -- Comment
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    }
    --LSP
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "saadparwaiz1/cmp_luasnip" },
      },
      config = function()
        require("krosis.cmp-config")
      end,
    }
    use { "onsails/lspkind-nvim" }
    --snipets
    use { "L3MON4D3/LuaSnip",
    config = function ()
        require('krosis.luasnip')
    end }
    --status bar
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("krosis.statusline")
      end,
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    use { "arkav/lualine-lsp-progress" }
    --terminal
    use { 'akinsho/toggleterm.nvim' }
    --distraction free mode
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("krosis.zen-mode-config")
        end,
    }

	if packer_bootstrap then
		require('packer').sync()
	end
end,
 config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
}
