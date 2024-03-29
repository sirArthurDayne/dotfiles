require('mason').setup {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
    keymaps = {
        -- Keymap to expand a server in the UI
        toggle_server_expand = "<CR>",
        -- Keymap to install the server under the current cursor position
        install_server = "i",
        -- Keymap to reinstall/update the server under the current cursor position
        update_server = "u",
        -- Keymap to check for new version for the server under the current cursor position
        check_server_version = "c",
        -- Keymap to update all installed servers
        update_all_servers = "U",
        -- Keymap to check which installed servers are outdated
        check_outdated_servers = "C",
        -- Keymap to uninstall a server
        uninstall_server = "X",
        -- Keymap to cancel a package installation
        cancel_installation = "<C-c>",
        -- Keymap to apply language filter
        apply_language_filter = "<C-f>",
    },
}

require('mason-lspconfig').setup()

-- Setup Remaps for every LSP
local Remap = require("krosis.config.keymaps")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("gD", function() vim.lsp.buf.declaration() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>aws", function() vim.lsp.buf.add_workspace_folder() end)
			nnoremap("<leader>lws", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
			nnoremap("<C-l>d", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<C-l>vl", function() vim.diagnostic.show_line_diagnostics() end)
			nnoremap("<C-l>ca", function() vim.lsp.buf.code_action() end)
			nnoremap("<C-l>vr", function() vim.lsp.buf.references() end)
			nnoremap("<C-l>r", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

-- LUA/Neovim
require("lspconfig").lua_ls.setup(config({
     settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}))
-- JS/TS LSP
require("lspconfig").tsserver.setup(config())
-- terraform
require("lspconfig").terraformls.setup(config())
-- Python
require("lspconfig").pyright.setup(config())
--GOlang
require("lspconfig").gopls.setup(config({
    settings = {
        gofumpt = true,
    }
}))

vim.diagnostic.config({virtual_text = true})
