local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    -- colorscheme
    { 'rose-pine/neovim' },
    { 'ellisonleao/gruvbox.nvim', config = function() require("krosis.colorschemes-config") end, },
    -- telescope
    { 'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- git integration
    { "tpope/vim-fugitive", config = function () require("krosis.fugitive-config") end, },
    -- TreeSitter
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate", },
    { "windwp/nvim-autopairs" },
    -- Comment
    { "numToStr/Comment.nvim", config = function() require("Comment").setup() end, },
    --LSP
    {
        "jose-elias-alvarez/null-ls.nvim",
        "williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    --nvim-cmp
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-buffer" ,
         "hrsh7th/cmp-nvim-lsp" ,
         "hrsh7th/cmp-path" ,
         "hrsh7th/cmp-nvim-lua" ,
         "saadparwaiz1/cmp_luasnip" ,
      },
      config = function() require("krosis.cmp-config") end,
    },
    { "onsails/lspkind-nvim" },
    --snipets
    { "L3MON4D3/LuaSnip", config = function () require('krosis.luasnip-config') end, },
    --status bar
    { "nvim-lualine/lualine.nvim",
        config = function() require("krosis.lualine-config") end,
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "arkav/lualine-lsp-progress",
        lazy = true },
    },
    --terminal
    { 'akinsho/toggleterm.nvim' },
    --distraction free mode
    { "folke/zen-mode.nvim", config = function() require("krosis.zen-mode-config") end, },
    --debugger
    { "rcarriga/nvim-dap-ui",
         dependencies = {
             "mfussenegger/nvim-dap"
         },
    },
    { "rcarriga/nvim-notify" },
    { "ThePrimeagen/harpoon" },
    --go
    "olexsmir/gopher.nvim",
    "leoluz/nvim-dap-go",
})
