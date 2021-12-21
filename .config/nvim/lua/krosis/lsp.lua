vim.opt.completeopt = { "menu", "menuone", "noselect" }

local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmp = require('cmp')
local lspkind = require('lspkind')
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[T9]",
    path = "[Path]",
}

lspkind.init({
    with_text = true,
})

cmp.setup({
    snippet = {},
    mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping {
            i = cmp.mapping.confirm { select = true },
        },
        ["<C-y>"] = cmp.mapping.confirm { --read h: ins-completion
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end
    },
    experimental = {
        native_menu = false,
        ghost_menu = true,
        ghost_text = true,
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length=3 },
        { name = "path" },
        --{ name = "cmp_tabnine" },
    },
})

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '..',
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

nvim_lsp.powershell_es.setup{
  bundle_path = 'd:/Dev/Proyects/githubDownloads/PowerShellEditorServices',
  shell = 'powershell.exe',
  -- cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', "d:/PowerShellEditorServices/Start-EditorServices.ps1"}
}

require('Comment').setup({})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
