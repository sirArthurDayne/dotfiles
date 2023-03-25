local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.completion.spell,
	},
})

vim.keymap.set("n", "<leader>vf", function()
	return vim.lsp.buf.format({ async = true })
end, {})
