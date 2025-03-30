return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { 'saghen/blink.cmp' },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            -- configure events across lsp servers
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup('krosis-lsp-attach', { clear = true }),
                callback = function(args)
                    --verify if client support lsp first
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    --format on save file event: 'textDocument/formatting'
                    if client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting, args.buf) then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                    -- cursor hightlight event: 'textDocument/documentHighlight'
                    if client:supports_method(vim.lsp.protocol.Methods.textDocument_document_Highlight, args.buf) then
                        local hightlight_augroup = vim.api.nvim_create_augroup('krosis-lsp-hightlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = args.buf,
                            group = hightlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = args.buf,
                            group = hightlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('krosis-lsp-dettach', { clear = true }),
                            callback = function(args2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'krosis-lsp-hightlight', buffer = args2.buf }
                            end,
                        })
                    end
                    -- keymaps on all lsp servers actions
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
                    end
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]o to [d]efinition')
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                    map("<leader>vf", vim.lsp.buf.format, "[v]iew code [f]ormating")
                    map("gl", vim.diagnostic.open_float, "open diagnostics in float window")
                    --vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, { desc = "Format code on command" })
                    --vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "open diagnostics in float window" })
                end,
            })
            -- configure diagnostics for all servers
            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = vim.g.have_nerd_font and {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                } or {},
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                },
            }

            --MANUAL SETUP NOT USE
            --require("lspconfig").lua_ls.setup {}

            --dynamic lsp enable - h: mason-lspconfig-automatic-server-setup
            --local capabilities = vim.lsp.protocol.make_client_capabilities()

            local handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
                    -- local blink_capabilities = require('blink.cmp').get_lsp_capabilities()
                    require("lspconfig")[server_name].setup {}
                end,
                -- below define targeted overrides for specific servers. ["lua_ls"] = function() <DEFINE_TABLE> end
            }
            require("mason-lspconfig").setup_handlers(handlers)
        end,
    }
}
