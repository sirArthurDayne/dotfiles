vim.opt.completeopt = { "menu", "menuone", "noselect" }

local nvim_lsp_statusOk, nvim_lsp = pcall(require,'lspconfig')
if not nvim_lsp_statusOk then
    return
end

-- local protocol = require('vim.lsp.protocol')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp_statusOk, cmp = pcall(require,'cmp')
if not cmp_statusOk then
    return
end

local lspkind_statusok, lspkind = pcall(require, 'lspkind')
if not lspkind_statusok then
    return
end

local source_mapping = {
    buffer = "[BUFF]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[LUA]",
    cmp_tabnine = "[T9]",
    path = "[PATH]",
    luasnip = "[SNIP]",
}

cmp.setup({
    snippet = {
          -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
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
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            before = function(entry, vim_item)
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
    })
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
        { name = 'luasnip' },
        { name = 'nvim_lua' }
        --{ name = "cmp_tabnine" },
    },
})

--local tabnine = require('cmp_tabnine.config')
--tabnine:setup({
    --max_lines = 1000,
    --max_num_results = 20,
    --sort = true,
	--run_on_every_keystroke = true,
	--snippet_placeholder = '..',
--})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		caabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

nvim_lsp.powershell_es.setup({
  bundle_path = 'd:/Dev/Proyects/githubDownloads/PowerShellEditorServices',
})

nvim_lsp.tsserver.setup({})

nvim_lsp.clangd.setup({
    cmd = {"clangd"},
    filetypes = { "c", "cpp", "objc", "objcpp" },
    --root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    single_file_support = true,
})

--lua lsp setup
local sumneko_root_path = "d:/Dev/Proyects/githubDownloads/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

nvim_lsp.sumneko_lua.setup(config({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))


