return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local noice = require("noice")
		noice.setup({
			lsp = {
				progress = {
					enabled = false,
				},
			},
		})
	end,
}
