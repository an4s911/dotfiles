return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- These are formatters and linters that I use, you can add/remove as you want

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettierd.with({
				-- 	filetypes = { "javascript", "javascriptreact", "css", "html", "json", "yaml", "markdown", "jsonc" },
				-- 	extra_args = { "--tab-width=4" },
				-- }),
				-- null_ls.builtins.formatting.black,
				-- null_ls.builtins.formatting.isort,
				-- null_ls.builtins.formatting.uncrustify.with({
				-- 	filetypes = { "java" },
				-- }),
				-- null_ls.builtins.formatting.shfmt,
				-- null_ls.builtins.formatting.djlint,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format", silent = true })
	end,
}
