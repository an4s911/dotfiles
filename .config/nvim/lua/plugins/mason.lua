return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				-- ensure_installed = {
					"html",
					"jdtls",
					"lua_ls",
					"pylsp",
					"tailwindcss",
					"tsserver",
					"bashls",
					"emmet_ls",
				},
			})
		end,
	},
}
