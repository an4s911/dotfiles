return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")

		-- !!!!! The following are the language servers I use. You can add/remove any LSPs that you want here. !!!!!

		-- lspconfig.tsserver.setup({
		-- 	capabilities = capabilities,
		-- })
		--
		-- lspconfig.tailwindcss.setup({
		-- 	capabilities = capabilities,
		-- })
		--
		-- lspconfig.html.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = { "html", "htmldjango" },
		-- })
		-- lspconfig.lua_ls.setup({
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		Lua = {
		-- 			runtime = {
		-- 				-- Tell the language server which version of Lua you're using
		-- 				-- (most likely LuaJIT in the case of Neovim)
		-- 				version = "LuaJIT",
		-- 			},
		-- 			diagnostics = {
		-- 				-- Get the language server to recognize the `vim` global
		-- 				globals = {
		-- 					"vim",
		-- 					"require",
		-- 					"MiniMap",
		-- 				},
		-- 			},
		-- 			workspace = {
		-- 				-- Make the server aware of Neovim runtime files
		-- 				library = vim.api.nvim_get_runtime_file("", true),
		-- 			},
		-- 			-- Do not send telemetry data containing a randomized but unique identifier
		-- 			telemetry = {
		-- 				enable = false,
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- lspconfig.jdtls.setup({
		-- 	capabilities = capabilities,
		-- })
		-- lspconfig.pylsp.setup({
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		pylsp = {
		-- 			plugins = {
		-- 				pycodestyle = {
		-- 					maxLineLength = 88,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- lspconfig.bashls.setup({
		-- 	capabilities = capabilities,
		-- })
		-- lspconfig.emmet_ls.setup({
		-- 	capabilities = capabilities,
		-- })

		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", silent = true })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition", silent = true })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References", silent = true })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", silent = true })
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename in normal mode", silent = true })
		vim.keymap.set("i", "<F2>", vim.lsp.buf.rename, { desc = "Rename in insert mode", silent = true })
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic", silent = true })
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", silent = true })
	end,
}
